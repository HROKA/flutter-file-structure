import '../../api_manger/ApiRequest.dart';
import '../../api_manger/index.dart';
import '../../components/index.dart';
import '../../utils/index.dart';
import '../index.dart';

class SignUpController extends GetxController {
  TextInputController mobileNumberController = TextInputController();
  ButtonController buttonController = ButtonController(isEnabled: false);

  String mobileNumber;

  onChangeValue(value) {
    mobileNumber = value;
    buttonController.isEnabled = value.length == 9;
    update();
  }

  onSubmit() {
    ApiRequest(
      methoud: POST_METHOUD,
      path: REQUEST_OTP,
      data: {
        'mobile_number': '966$mobileNumber',
      },
    ).request(
      onSuccess: (data, response) {
        Get.toNamed(VERIFICATION_ROUTE);
      },
    );
  }
}
