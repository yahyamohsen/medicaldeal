import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';

import '../../../../../core/Error/failures.dart';
import '../../../repositries/service_provider_repo.dart';

part 'service_provider_state.dart';

class ServiceProviderCubit extends Cubit<ServiceProviderState> {
  ServiceProviderCubit(this.serviceProviderRepo)
      : super(ServiceProviderInitial());

  final ServiceProviderRepo serviceProviderRepo;

  List<ServiceProviderModel>? providers;
  getServiceProviders() async {
    emit(ServiceProviderLoading());

    var result = await serviceProviderRepo.getServiceProviders();

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ServiceProviderNetworkFailure(failure.errMessage));
      } else {
        emit(ServiceProviderFailure(failure.errMessage));
      }
    }, (r) {
      providers = r;
      emit(ServiceProviderSuccess(r));
    });
  }
}
