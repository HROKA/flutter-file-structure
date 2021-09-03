import 'package:terrace/api_manger/ApiRequest.dart';
import 'package:terrace/api_manger/index.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../components/index.dart';
import '../../utils/index.dart';
import '../index.dart';

class VerificationController extends GetxController {
  final SignUpController signupController = Get.find<SignUpController>();
  final MyAppController _myAppController = Get.find<MyAppController>();
  ButtonController verificationButton = ButtonController(isEnabled: false);

  String otp = '';
  bool isTimerFinish = false;
  final CountdownController countdownController = new CountdownController();

  onTimerFinish() {
    this.isTimerFinish = !isTimerFinish;
    update();
  }

  verifyAccount() async {
    Map map = Map();
    map['mobile_number'] = '966${signupController.mobileNumber}';
    map['otp_code'] = otp;
    map['fcm_token'] = 'await FirebaseMessaging.instance.getToken()';
    ApiRequest(
      methoud: POST_METHOUD,
      path: VALIDATE_OTP,
      data: map,
    ).request(
      // beforeSend: () => {},
      onSuccess: (data, response) {
        if (data == null || data.isEmpty) {
          Get.toNamed(COMPLETE_PROFILE_ROUTE);
        } else {
          _myAppController.onUserAuthenticated(data);
        }
      },
      // onError: (error) => {},
    );
  }

  onOTPChange(otp) {
    this.otp = otp;
    verificationButton.isEnabled = otp.length == 4 ? true : false;
    update();
  }
}
