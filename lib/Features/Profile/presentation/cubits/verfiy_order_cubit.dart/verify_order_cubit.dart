import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/Error/failures.dart';
import '../../../repositories/profile_repo.dart';

part 'verify_order_state.dart';

class VerifyOrderCubit extends Cubit<VerifyOrderState> {
  VerifyOrderCubit(this.profileRepo) : super(VerifyOrderInitial());

  final ProfileRepo profileRepo;
  void verfiyOrder({required String orderId, required String userId}) async {
    emit(VerifyOrderLoading());

    var result = await profileRepo.verfyOrder(orderId: orderId, userId: userId);
    result.fold((failure) {
      emit(VerifyOrderFailure(failure.errMessage));
    }, (r) {
      emit(VerifyOrderSuccess());
    });
  }
}
