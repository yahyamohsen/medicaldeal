import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/validate_promo_code_cubit.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/check_out_items.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/checkout_item_for_pharmacy.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/promo_code.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/pyment_card.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/total_and_discount.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_list_item.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/singleton/shared_prefrence_singleton.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../Auth/models/user_model.dart';
import '../../data/models/check_out_model.dart';
import '../manger/cubit/checkout_cubit.dart';
import 'check_out_view_body.dart';

class CheckoutViewForPharmacyBody extends StatefulWidget {
  const CheckoutViewForPharmacyBody(
      {super.key, required this.selectedServices});

  final List<SelectedServiceModel> selectedServices;

  @override
  State<CheckoutViewForPharmacyBody> createState() =>
      _CheckoutViewForPharmacyBodyState();
}

class _CheckoutViewForPharmacyBodyState
    extends State<CheckoutViewForPharmacyBody> {
  double price = 0;
  double discountPrice = 0;
  double totalPrice = 0;
  String? promoCodeID;
  @override
  void initState() {
    for (int i = 0; i < widget.selectedServices.length; i++) {
      var item = widget.selectedServices[i];
      price += (item.serviceModel.price ?? 1) * item.count;
      discountPrice += (item.serviceModel.userDiscount ?? 1) * item.count;
    }

    totalPrice = price - discountPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidatePromoCodeCubit, ValidatePromoCodeState>(
        listener: (context, state) {
      if (state is ValidatePromoCodeSuccess) {
        sucessBar(context, message: S.current.promo_code_applied);
        updatePriceValues(state);
      }

      if (state is ValidatePromoCodeFailure) {
        errorBar(context, message: state.errMessage);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        progressIndicator: const CustomLoadingIndicator(),
        inAsyncCall: state is ValidatePromoCodeLoading ? true : false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceBox(
                height: 2,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhyarmcyCeckoutItems(
                    title: S.of(context).alle_selected_items,
                    selectedServices: widget.selectedServices,
                  ),
                  const PaymentCard(),
                  const PromoCode(),
                  const SpaceBox(
                    height: 2,
                  ),
                  TotallAndDiscountWidget(
                    discountPrice: discountPrice,
                    price: price,
                    totalPrice: totalPrice,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  onTap: () {
                    var userId = UserModel.fromJson(Prefs.getObject(kUserModel))
                        .id
                        .toString();

                    List<List<double>> data = getData(widget.selectedServices);
                    OrderModel orderModel = OrderModel(
                        serviceProviderId: '0',
                        promoCodeId: promoCodeID,
                        userId: userId,
                        services: data,
                        amount: '500',
                        total: totalPrice.toString());
                    BlocProvider.of<CheckoutCubit>(context)
                        .addOrder(orderModel);
                  },
                  text: 'Confirm',
                  gradient: kLinearGradient,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void updatePriceValues(ValidatePromoCodeSuccess state) {
    var promoCode = state.promoCodeModel;
    promoCodeID = promoCode.id;
    if (promoCode.discountTypeId == '1') {
      if (promoCode.maxdiscount?.isNotEmpty ?? false) {
        discountPrice += double.parse(promoCode.maxdiscount!);
      } else {
        discountPrice += double.parse(promoCode.discount!);
      }
    } else {
      if (promoCode.maxdiscount?.isNotEmpty ?? false) {
        var percent = double.parse(promoCode.maxdiscount!);
        var discountValue = (percent * totalPrice) / 100;
        discountPrice += discountValue;
      } else {
        var percent = double.parse(promoCode.discount!);
        var discountValue = (percent * totalPrice) / 100;
        discountPrice += discountValue;
      }
    }
  }

  List<List<double>> getData(List<SelectedServiceModel> selectedServices) {
    List<List<double>> data = [];

    for (int index = 0; index < selectedServices.length; index++) {
      List<double> item = [];
      double itemPrice = selectedServices[index].serviceModel.price! -
          selectedServices[index].serviceModel.userDiscount!;
      item.add(double.parse(selectedServices[index].serviceModel.id!));
      item.add(itemPrice);
      item.add(selectedServices[index].count.toDouble());

      data.add(item);
    }
    return data;
  }
}
