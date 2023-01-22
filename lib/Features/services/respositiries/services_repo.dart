import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class ServicesRepo {
  Future<Either<Failure, List<ServiceModel>>> fetchServices(
      {required String id});
  Future<Either<Failure, List<ServiceProviderModel>>> fetchServiceByTypId(
      {required String id});
  Future<Either<Failure, List<ServiceModel>>> fetchMedicenesList();
  Future<Either<Failure, void>> addPharmacyOrder({required File image});
}
