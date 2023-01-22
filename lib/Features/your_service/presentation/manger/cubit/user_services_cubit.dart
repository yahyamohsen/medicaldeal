import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/your_service/data/models/user_service_model.dart';
import 'package:sart_up_project/Features/your_service/data/repo/user_services_repo.dart';

part 'user_services_state.dart';

class UserServicesCubit extends Cubit<UserServicesState> {
  UserServicesCubit(this.servicesRepo) : super(UserServicesInitial());

  final UserServicesRepo servicesRepo;
  fetchUserServices({required String userId}) async {
    emit(UserServicesLoading());
    var result = await servicesRepo.fetchUserServices(userId: userId);
    result.fold((failure) {
      emit(
        UserServicesFailure(failure.errMessage),
      );
    }, (r) {
      emit(UserServicesSuccess(r));
    });
  }

  refreshUserServices({required String userId}) async {
    var result = await servicesRepo.fetchUserServices(userId: userId);

    result.fold((failure) {
      emit(
        UserServicesFailure(failure.errMessage),
      );
    }, (r) {
      emit(UserServicesSuccess(r));
    });
  }
}
