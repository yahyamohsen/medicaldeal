import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/Profile/repositories/profile_repo.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.profileRepo) : super(SignOutInitial());

  final ProfileRepo profileRepo;
  void signOut() async {
    emit(SignOutLoading());

    var result = await profileRepo.signOut();
    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(SignOutNetworkFailure());
      } else {
        emit(SignOutFailure(failure.errMessage));
      }
    }, (r) {
      Prefs.prefs.remove(
        kToken,
      );
      emit(SignOutSucess());
    });
  }
}
