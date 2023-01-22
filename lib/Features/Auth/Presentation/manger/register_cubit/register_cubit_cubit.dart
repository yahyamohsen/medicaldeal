import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/Error/failures.dart';
import '../../../repositories/auth_repo_interface.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit(this.authRepo) : super(RegisterCubitInitial());

  final IAuthRepo authRepo;

  registerUser(
      {required String password,
      required String phone,
      required String userName}) async {
    emit(Loading());

    var result = await authRepo.registerUser(
        password: password, phone: phone, userName: userName);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(NoInternetConnection());
      } else {
        emit(Failure(failure.errMessage));
      }
    }, (r) {
      emit(Success());
    });
  }
}
