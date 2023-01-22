import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/respositiries/services_repo.dart';

import '../../../../../core/Error/failures.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(this.servicesRepo) : super(ServicesInitial());

  final ServicesRepo servicesRepo;

  fetchServices({required String id}) async {
    emit(ServicesLoading());

    var result = await servicesRepo.fetchServices(id: id);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ServicesNetWorkFailure());
      } else {
        emit(ServicesFailure(failure.errMessage));
      }
    }, (r) {
      emit(ServicesSuccess(services: r));
    });
  }

  fetchServicesByTypeId({required String id}) async {
    emit(ServicesLoading());

    var result = await servicesRepo.fetchServiceByTypId(id: id);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ServicesNetWorkFailure());
      } else {
        emit(ServicesFailure(failure.errMessage));
      }
    }, (r) {
      emit(ServicesSuccess(serviceProviders: r));
    });
  }

  fetchMedicinesList() async {
    emit(ServicesLoading());

    var result = await servicesRepo.fetchMedicenesList();

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ServicesNetWorkFailure());
      } else {
        emit(ServicesFailure(failure.errMessage));
      }
    }, (r) {
      emit(ServicesSuccess(services: r));
    });
  }
}
