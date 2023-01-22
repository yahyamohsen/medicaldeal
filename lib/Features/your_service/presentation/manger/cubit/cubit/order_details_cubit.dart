import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/your_service/data/models/order_details_model.dart';

import '../../../../data/repo/user_services_repo.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.servicesRepo) : super(OrderDetailsInitial());

  final UserServicesRepo servicesRepo;
  fetchOrderDetails({required String userId, required String orderId}) async {
    emit(OrderDetailsLoading());

    var result = await servicesRepo.fetchOrderDetails(
      userId: userId,
      orderId: orderId,
    );

    result.fold((failure) {
      emit(
        OrderDetailsFailure(failure.errMessage),
      );
    }, (r) {
      emit(OrderDetailsSuccess(r));
    });
  }
}
