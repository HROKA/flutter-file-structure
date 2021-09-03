import '../../api_manger/index.dart';
import '../../index.dart';

class AddNewAddressController extends GetxController {
  var latitude = "31.224545";
  var longitude = "32.54545";

  checkNotEmpty(index) => inputList[index]['controller'].getText().isNotEmpty;
  getText(index) => inputList[index]['controller'].getText();

  List inputList = [
    {
      "title": 'address_name'.tr,
      "input_type": TEXT_INPUT_TYPE,
      "controller": TextInputController(),
    },
    {
      "title": 'house_or_office_no'.tr,
      "input_type": NUMBER_INPUT_TYPE,
      "controller": TextInputController(),
    },
    {
      "title": 'street_address_auto_filled'.tr,
      "input_type": TEXT_INPUT_TYPE,
      "controller": TextInputController(text: 'SHADI TEST'),
    },
  ];
  validationForm() {
    if (checkNotEmpty(0) &&
        checkNotEmpty(1) &&
        checkNotEmpty(2) &&
        latitude.isNotEmpty &&
        longitude.isNotEmpty) {
      return true;
    }
    return false;
  }

  saveAddress() {
    if (validationForm()) {
      Map map = {
        'title': getText(0),
        'building_number': getText(1),
        'latitude': this.latitude,
        'longitude': this.longitude,
        'is_preferred': 1,
        'full_address': getText(2)
      };
      ApiRequest(
        path: ADDRESS,
        methoud: POST_METHOUD,
        data: map,
      ).request(
        onSuccess: (data, response) {
          Get.find<DeliveryScreenController>().getAddressData();
          Get.back();
        },
      );
    } else {
      showMessage(description: 'AllFealdReqourd'.tr);
    }
  }
}
