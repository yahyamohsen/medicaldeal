import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class GooglePlacesRepo {
  Future<Either<Failure, List<PlaceModel>>> fetchPlacesById({
    required List<int> ids,
    required double lat,
    required double long,
  });
  Future<Either<Failure, List<PlaceModel>>> fetchPlacesByLocation({
    required double lat,
    required double long,
  });
}
