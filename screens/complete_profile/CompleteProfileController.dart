import 'package:intl/intl.dart';
import 'package:terrace/api_manger/ApiRequest.dart';
import 'package:terrace/api_manger/index.dart';
import 'package:terrace/index.dart';

class CompleteProfileController extends GetxController {
  final SignUpController signupController = Get.find<SignUpController>();
  final MyAppController _myAppController = Get.find<MyAppController>();

  ButtonController completeProfilebutton = ButtonController(
    isEnabled: false,
  );
  String fullName, phoneNumber, email, dateOfBirth, referralCode;
  Gender gender = Gender.male;
  List inputItems;
  buttonValidation(value) => completeProfilebutton.isEnabled =
      value.replaceAll(' ', '').isNotEmpty && (dateOfBirth != null);

  setInputItems() {
    inputItems = [
      {
        "icon": USER_PROFILE_ICON,
        "hint": "full_name".tr,
        "controller": TextInputController(),
        "inputType": TEXT_INPUT_TYPE,
        "value": fullName,
      },
      {
        "icon": PHONE_PROFILE_ICON,
        "hint": "mobile_number".tr,
        "controller": TextInputController(
          text: '966${signupController.mobileNumber}',
          isReadOnly: true,
        ),
        "inputType": NUMBER_INPUT_TYPE,
        "value": phoneNumber,
      },
      {
        "icon": EMAIL_PROFILE_ICON,
        "hint": "email".tr,
        "controller": TextInputController(),
        "inputType": EMAIL_INPUT_TYPE,
        "value": email,
      },
      {
        "icon": DOB_PROFILE_ICON,
        "hint": "date_of_birth".tr,
        "controller": TextInputController(
          isReadOnly: true,
        ),
        "inputType": TEXT_INPUT_TYPE,
        "value": dateOfBirth,
      },
      {
        "icon": REF_CODE_PROFILE_ICON,
        "hint": "referral_code".tr,
        "controller": TextInputController(),
        "inputType": TEXT_INPUT_TYPE,
        "value": referralCode,
      }
    ];
  }

  onChangevalue(key, newValue) {
    print('**$newValue**');
    if (key == USER_PROFILE_ICON) {
      fullName = newValue;
      buttonValidation(newValue);
    } else if (key == EMAIL_PROFILE_ICON) {
      email = newValue;
      buttonValidation(newValue);
    } else if (key == REF_CODE_PROFILE_ICON) {
      referralCode = newValue;
      buttonValidation(newValue);
    }
    update();
  }

  onGenderChange(Gender newValue) {
    gender = newValue;
    update();
  }

  onChangeDate(value) {
    dateOfBirth = '${DateFormat('yyyy-MM-dd').format(value)}';
    inputItems[3]['controller'].setText(dateOfBirth);
    completeProfilebutton.isEnabled =
        (fullName != null && fullName.replaceAll(' ', '').isNotEmpty) &&
            (dateOfBirth != null);
    update();
  }

  onSubmit() {
    Map map = Map();
    map['first_name'] = fullName;
    map['gender'] = gender == Gender.male ? "MALE" : "FEMALE";
    map['birth_date'] = dateOfBirth;
    map['mobile_number'] = '966${signupController.mobileNumber}';
    map['last_know_device_id'] = '51CD5D16-8DF4-4F8A-8112-CFE9B1260515';
    map['preferred_language'] = 'languageKey'.tr;
    map['referral_code'] = referralCode;

    ApiRequest(
      methoud: POST_METHOUD,
      path: REGISTER,
      data: map,
    ).request(
      onSuccess: (data, response) {
        _myAppController.onUserAuthenticated(data);
        Get.toNamed(HOME_ROUTE);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    setInputItems();
  }
}
