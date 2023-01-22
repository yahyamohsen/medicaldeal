import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, void>> sendFeedBack({
    required String title,
    required String description,
    File? image,
  });
}
