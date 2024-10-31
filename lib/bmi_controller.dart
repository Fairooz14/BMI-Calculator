import 'package:get/get.dart';

class BMIController extends GetxController {
  var height = 170.0.obs;
  var weight = 70.obs;
  var age = 23.obs;
  var isMale = true.obs;

  // BMI calculation formula
  double calculateBMI() {
    return weight.value / ((height.value / 100) * (height.value / 100));
  }

  void incrementWeight() => weight.value++;
  void decrementWeight() => weight.value--;

  void incrementAge() => age.value++;
  void decrementAge() => age.value--;
}
