import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/google_map/data/repositries/google_places_repo.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../../core/Error/exceptions.dart';

class GooglePlacesRepoImpl extends GooglePlacesRepo {
  final Api api;

  GooglePlacesRepoImpl(this.api);
  @override
  Future<Either<Failure, List<PlaceModel>>> fetchPlacesById({
    required List<int> ids,
    required double lat,
    required double long,
  }) async {
    try {
      Response response = await api.post(
        endPoint: 'getplaces',
        body: {
          "location_lat": lat,
          "location_lng": long,
          'services_id': ids,
        },
      );

      List<PlaceModel> places = [];

      for (var item in response.data) {
        places.add(PlaceModel.fromJson(item));
      }

      return right(places);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return left(
            ServerFailure.fromJson(e.response!.data),
          );
        }
        return left(
          ServerFailure(e.message),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<PlaceModel>>> fetchPlacesByLocation(
      {required double lat, required double long}) async {
    try {
      Response response = await api.post(
        endPoint: 'getNearestPlacesForMap',
        body: {
          "location_lat": 30.9977,
          "location_lng": 29.7432,
        },
      );

      List<PlaceModel> places = [];

      for (var item in response.data) {
        places.add(PlaceModel.fromJson(item));
      }

      return right(places);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return left(
            ServerFailure.fromJson(e.response!.data),
          );
        }
        return left(
          ServerFailure(e.message),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
