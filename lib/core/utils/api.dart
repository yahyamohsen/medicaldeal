import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/exceptions.dart';
import 'package:sart_up_project/core/network/network_info.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

class Api {
  final _baseUrl = 'https://medicaldeal.net/api/';

  final NetWrokInfo networkInformation;

  Api(this.networkInformation);

  Future<Response> get(
      {required String endPoint,
      userToken,
      String? lang,
      bool isBaseUrl = true}) async {
    log('Calling $_baseUrl$endPoint , with token $userToken');

    Map<String, dynamic> headers = {};
    headers.addAll({'Accept': 'application/json'});
    if (userToken != null) {
      headers.addAll({'Authorization': 'Bearer $userToken'});
    }

    if (lang != null) {
      headers.addAll({'Accept-Language': lang});
    }
    await checkConnectitvity();
    var response = await Dio()
        .get('$_baseUrl$endPoint', options: Options(headers: headers));
    return response;
  }

  Future<Response> post({
    required endPoint,
    @required dynamic body,
    String? bearerToken,
    bool isFormWithImage = false,
    bool withoutApi = false,
  }) async {
    debugPrint(
        'Calling $_baseUrl$endPoint with body $body  and bearerToken = $bearerToken');

    Map<String, dynamic> headers = {};

    headers.addAll({'accept': 'application/json'});

    if (bearerToken != null) {
      headers.addAll({
        'Authorization': 'Bearer $bearerToken',
      });
    }
    await checkConnectitvity();
    var response = await Dio().post(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
      data: isFormWithImage ? jsonEncode(body) : body,
    );

    log(response.data.toString());
    return response;
  }

  Future<Response> put(
      {required String endUrl, dynamic body, String? bearerToken}) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
    };
    if (bearerToken != null) {
      headers.addAll({'Authorization': 'Bearer $bearerToken'});
    }
    await checkConnectitvity();

    var response = await Dio().put(
      "$_baseUrl$endUrl",
      data: body,
      options: Options(
          headers: headers, contentType: Headers.formUrlEncodedContentType),
    );

    return response;
  }

  Future<String> uploadServiceImage(
      File image, String bearerToken, phoneNumber) async {
    await checkConnectitvity();
    var fileName = image.path.split('/').last;

    FormData form = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType('image', 'png'),
      ),
      'phone': UserModel.fromJson(Prefs.getObject(kUserModel)).phone,
    });

    var response = await Dio().post(
      '${_baseUrl}changephoto',
      data: form,
      options: Options(headers: {
        'Authorization': 'Bearer $bearerToken',
        'Accept': 'application/json',
      }),
    );

    return response.data['photo'];
  }

  Future<void> checkConnectitvity() async {
    bool isConnected = await networkInformation.isConnected;
    if (!isConnected) throw NetWorkException();
  }
}
