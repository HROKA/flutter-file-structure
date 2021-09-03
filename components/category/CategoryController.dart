import 'package:get/get.dart';

class CategoryController extends GetxController {
  int selectedId;
  Function onCategoryPressed;

  CategoryController({
    this.onCategoryPressed,
    this.selectedId = 0,
  });

  onPress(categoryId) {
    selectedId = categoryId;
    onCategoryPressed(selectedId);
    update();
  }

  List catItems = [];
}
