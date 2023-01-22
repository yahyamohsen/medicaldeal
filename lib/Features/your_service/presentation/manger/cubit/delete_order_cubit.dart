import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/user_services_repo.dart';

part 'delete_order_state.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderState> {
  DeleteOrderCubit(this.servicesRepo) : super(DeleteOrderInitial());

  final UserServicesRepo servicesRepo;
  deleteOrder({required String userId, required String orderId}) async {
    emit(DeleteOrderLoading());

    var result = await servicesRepo.deleteService(
      userId: userId,
      orderId: orderId,
    );

    result.fold((failure) {
      emit(
        DeleteOrderFailure(failure.errMessage),
      );
    }, (r) {
      emit(DeleteOrderSuccess());
    });
  }
}
