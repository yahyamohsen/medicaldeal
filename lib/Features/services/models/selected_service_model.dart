import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';

class SelectedServiceModel extends Equatable {
  final ServiceModel serviceModel;
  int count;

  SelectedServiceModel(this.serviceModel, this.count);

  @override
  List<Object?> get props => [serviceModel];
}
