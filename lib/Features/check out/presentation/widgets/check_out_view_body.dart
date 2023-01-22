import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/localized_text_model.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/check%20out/data/models/check_out_model.dart';
import 'package:sart_up_project/Features/check%20out/data/models/place_with_named_services.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/checkout_cubit.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/totall_price.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_counter.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_bar_code_view.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/custom_check_out_card.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../../../../generated/l10n.dart';
import '../manger/cubit/validate_promo_code_cubit.dart';
import 'check_out_items.dart';
import 'promo_code.dart';
import 'pyment_card.dart';
import 'total_and_discount.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({Key? key}) : super(key: key);

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  double price = 0;
  double discountPrice = 0;
  double totalPrice = 0;

  @override
  void initState() {
    var services =
        BlocProvider.of<CheckoutCubit>(context).placesWithServices[0].services;
    for (int i = 0; i < services.length; i++) {
      var item = services[i];
      price += item.price ?? 0;
      discountPrice += item.userDiscount ?? 0;
    }

    totalPrice = price - discountPrice;
    super.initState();
  }

  String? promoCodeID;

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
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ValidatePromoCodeLoading ? true : false,
          progressIndicator: const CustomLoadingIndicator(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SpaceBox(
                  height: 2,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: BlocProvider.of<CheckoutCubit>(context)
                          .placesWithServices
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            child: CheckOutItems(
                              title: getLocalizedData(
                                BlocProvider.of<CheckoutCubit>(context)
                                    .placesWithServices[index]
                                    .placeModel
                                    .titleEn,
                                BlocProvider.of<CheckoutCubit>(context)
                                    .placesWithServices[index]
                                    .placeModel
                                    .title,
                              ),
                              services: BlocProvider.of<CheckoutCubit>(context)
                                  .placesWithServices[index]
                                  .services,
                            ));
                      },
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
                    ),
                    const SpaceBox(
                      height: 2,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomButton(
                    onTap: () {
                      var userId =
                          UserModel.fromJson(Prefs.getObject(kUserModel))
                              .id
                              .toString();
                      List<PlaceWithNamedServices> placeWithServices =
                          BlocProvider.of<CheckoutCubit>(context)
                              .placesWithServices;
                      List<List<double>> servicesId =
                          getServicesId(placeWithServices);
                      OrderModel orderModel = OrderModel(
                          userId: userId,
                          promoCodeId: promoCodeID,
                          serviceProviderId: placeWithServices
                              .first.placeModel.serviceProviderId!,
                          services: servicesId,
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
      },
    );
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

  List<List<double>> getServicesId(
      List<PlaceWithNamedServices> placeWithServices) {
    List<List<double>> servicesIds = [];

    for (var placeWithServices in placeWithServices) {
      List<double> serviceIds = [];
      for (var service in placeWithServices.services) {
        serviceIds.add(double.parse(service.id!));
      }

      servicesIds.add(serviceIds);
    }
    return servicesIds;
  }
}
