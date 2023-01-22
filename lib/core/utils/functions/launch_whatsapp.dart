import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

import '../../widgets/error_bar.dart';

Future<void> launchWhatsapp(context, {required String number}) async {
  var formattedNumber = number.replaceAll('-', '');
  formattedNumber = formattedNumber.replaceAll('+', '');
  var whatsappUrl = "https://wa.me/$formattedNumber";

  if (Platform.isIOS) {
    await launchCustomUrl(context, whatsappUrl);
  } else {
    await launchCustomUrl(context, whatsappUrl);  
  }
}

Future<void> launchCustomUrl(context, String customUrl) async {
  var url = Uri.parse(customUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    errorBar(context, message: 'Failed to open $customUrl');
  }
}
