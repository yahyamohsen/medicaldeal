import 'dart:typed_data';

import '../../../Features/google_map/data/models/location_pin_image_model.dart';

Uint8List getImage(String id, MapImageModel images) {
  if (id == '1') {
    return images.hospital!;
  } else if (id == '2') {
    return images.lap!;
  } else if (id == '4') {
    return images.pharmacy!;
  } else if (id == '5') {
    return images.radiaolgy!;
  } else if (id == '6') {
    return images.physicalTherpay!;
  }
  return images.doctor!;
}
