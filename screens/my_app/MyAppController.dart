import '../index.dart';

import '../../utils/index.dart';

class MyAppController extends GetxController {
  var userData, settings;
  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() async {
    super.onInit();
    userData = await localStorage.getFromStorage(key: USER_DATA);
    print('*** userData *** : $userData');
    await getCurrentLocation();
  }

  void onUserAuthenticated(userData) {
    localStorage.saveToStorage(key: USER_DATA, value: userData);
    this.userData = userData;
    print('User Added Successefully: (userData: $userData');
    // Get.put(FullDrawerController());
    Get.offAllNamed(HOME_ROUTE);
    update();
  }

  void onUserUpdated(userData) {
    localStorage.saveToStorage(key: USER_DATA, value: userData);
    this.userData = userData;
    print('User Updated Successefully: (userData: $userData');
    update();
  }

  void onSettingsUpdated(settings) {
    localStorage.saveToStorage(key: SETTINGS, value: settings);
    this.settings = settings;
    print('*** On Settings Updated  *** : $settings');
  }

  void onSignOut() {
    localStorage.erase();
    userData = null;
    // Get.delete<FullDrawerController>();
    Get.delete<SignUpController>();
    Get.offAllNamed(SIGNUP_ROUTE);
    Get.put(SignUpController());
    update();
  }
}
