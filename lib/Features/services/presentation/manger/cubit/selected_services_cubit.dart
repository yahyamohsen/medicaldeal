import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';

part 'selected_services_state.dart';

class SelectedServicesCubit extends Cubit<SelectedServicesState> {
  SelectedServicesCubit() : super(SelectedServicesInitial());

  List<SelectedServiceModel> selectedServices = [];

  void selectService(SelectedServiceModel selectedServiceModel) {
    selectedServices.add(
      selectedServiceModel,
    );
    emit(SelectedServicesChange(selectedServices.length));
  }

  void deSelectService(SelectedServiceModel selectedServiceModel) {
    selectedServices.remove(
      selectedServiceModel,
    );
    emit(SelectedServicesChange(selectedServices.length));
  }

  void incrementCount(index) {
    selectedServices[index].count += 1;
    emit(SelectedServiceCountChange(selectedServices[index].count));
    emit(SelectedServicesChange(selectedServices.length));
  }

  void decrementCount(index) {
    selectedServices[index].count -= 1;
    emit(SelectedServiceCountChange(selectedServices[index].count));
    emit(SelectedServicesChange(selectedServices.length));
  }

  void reset() {
    selectedServices.clear();
    emit(SelectedServicesChange(selectedServices.length));
  }
}
