import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '/utils/index.dart';
import '../../controllers/index.dart';
import '../../utils/GeneratorKeyScript.dart';
import '../env.dart';
import '../screens/index.dart';

class ApiRequest {
  final String path;
  var data;
  String methoud;
  var response;
  bool withLoading;

  final AppLanguageController _appLanguageController =
      Get.find<AppLanguageController>();
  final MyAppController _myAppController = Get.find<MyAppController>();

  ApiRequest({
    @required this.path,
    this.data,
    this.methoud,
    this.withLoading = true,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(
      BaseOptions(
        headers: {
          'Authorization': _myAppController.userData != null
              ? 'Bearer ${_myAppController.userData['token']}'
              : '',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Language': _appLanguageController.appLocale,
          'key': generatorKeyScript(
            TENANT_LEVEL,
            TENANT_KEY,
            CLIENT_PREFIX,
            SECRET_PHRASE,
          ),
          'Client-Prefix': CLIENT_PREFIX,
          'Tenant-Key': TENANT_KEY,
          'Tenant-Level': TENANT_LEVEL,
          'Secret-Phrase': SECRET_PHRASE,
        },
      ),
    );
  }

  void request({
    Function() beforeSend,
    Function(dynamic data, dynamic response) onSuccess,
    Function(dynamic error) onError,
  }) async {
    // start request time
    DateTime startTime = DateTime.now();

    try {
      // show  request detils in debug console
      showRequestDetails(
        methoud: methoud,
        path: this.path,
        body: this.data.toString(),
      );
      // strat spinnet loading
      if (withLoading) startLoading();
      // check methoud type
      switch (methoud) {
        case GET_METHOUD:
          response = await _dio()
              .get(BASE_URL + this.path, queryParameters: this.data);

          break;
        case POST_METHOUD:
          response = await _dio().post(BASE_URL + this.path, data: this.data);
          break;
        case PUT_METHOUD:
          response = await _dio().put(BASE_URL + this.path, data: this.data);
          break;
      }
      // request time
      var time = DateTime.now().difference(startTime).inMilliseconds;
      // print response data in console
      printSuccessesResponse(response: response.data, time: time);
      if (onSuccess != null) {
        onSuccess(response.data['data'], response.data);
      }
      if (withLoading) dismissLoading();
    } catch (error) {
      // request time
      var time = DateTime.now().difference(startTime).inMilliseconds;

      if (error is DioError) {
        var errorResponse = error.response;
        // In case we get a null response for unknown reason
        var errorData = errorResponse != null
            ? errorResponse.data['status']
            : {"message": "Un handeled Error"};
        //handle DioError here by error type or by error code
        showMessage(
          description: errorData["message"],
          textColor: RED_COLOR,
        );
        // print response error
        printRequestError(error: errorData, time: time);

        if (onError != null) {
          onError(errorData);
        }
      } else {
        // handle another errors
        print('\x1B[31m **** Request catch another error ****');
        print('\x1B[33m Error>> $error');
        print('\x1B[31m ***************************');
      }
      if (withLoading) dismissLoading();
    }
  }
}
