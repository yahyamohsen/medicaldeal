import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sart_up_project/core/Error/failures.dart';

Future<Either<void, XFile>> pickImage() async {
  try {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return right(image!);
  } catch (e) {
    return left(null);
  }
}

Future<Either<void, XFile>> pickImageFromCamera() async {
  try {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return right(image!);
  } catch (e) {
    return left(null);
  }
}
