import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/Auth/repositories/auth_repo_interface.dart';
import 'package:sart_up_project/core/Error/failures.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final IAuthRepo authRepo;

  login({required String password, required String phone}) async {
    emit(Loading());

    var result = await authRepo.loginUser(password: password, phone: phone);

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
