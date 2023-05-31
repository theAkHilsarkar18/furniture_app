import 'package:get/get.dart';

class SignupController extends GetxController
{
  RxBool isVisible = true.obs;
  void visibilityChangeOfPassword()
  {
    isVisible.value = !isVisible.value;
  }
}
