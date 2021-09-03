import 'package:get/get.dart';

import '../../api_manger/index.dart';
import '../../index.dart';

class DeliveryScreenController extends GetxController {
  List deliveryList = [];

  getAddressData() {
    ApiRequest(
      path: ADDRESS,
      methoud: GET_METHOUD,
    ).request(
      onSuccess: (data, response) {
        deliveryList = data;
        update();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    getAddressData();
  }
}
