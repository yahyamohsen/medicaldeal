import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/check%20out/data/models/check_out_model.dart';
import 'package:sart_up_project/Features/check%20out/data/models/place_with_named_services.dart';
import 'package:sart_up_project/Features/check%20out/data/repositries/check_out_repo.dart';

import '../../../../../core/Error/failures.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;
  List<PlaceWithNamedServices> placesWithServices = [];

  void addOrder(OrderModel orderModel) async {
    emit(CheckoutLoading());

    var result = await checkoutRepo.addOrder(orderModel);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(CheckoutNetworkFailure(failure.errMessage));
      } else {
        emit(CheckoutFailure(failure.errMessage));
      }
    }, (r) {
      emit(CheckoutSuccess());
    });
  }
}
