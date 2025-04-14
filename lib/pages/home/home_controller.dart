import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedCategory = "Antipasti".obs;

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }

  String getCategoryType(String category) {
    switch (category) {
      case "Antipasti":
        return "app";
      case "Primi Piatti":
        return "pasta";
      case "Secondi Piatti":
        return "pizza";
      case "Dolci":
        return "dessert";
      case "Bevande":
        return "drink";
      default:
        return "";
    }
  }
}
