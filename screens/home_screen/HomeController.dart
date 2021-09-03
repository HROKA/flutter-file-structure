import '../../api_manger/index.dart';
import '../../components/index.dart';
import '../../utils/index.dart';
import '../index.dart';

class HomeController extends GetxController {
  List<String> banners = [];
  List deliveryMethods = [];

  getHomeData() {
    ApiRequest(
      path: HOME,
      methoud: GET_METHOUD,
    ).request(
      onSuccess: (data, response) {
        for (var item in data['banners']) {
          banners.add(item['image_url']);
        }
        deliveryMethods = data['delivery_methods'];
        update();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    getHomeData();
  }
}
