import 'package:get/get.dart';

class SigninController extends GetxController
{
  RxBool isVisible = true.obs;
  void visibilityChangeOfPassword()
  {
    isVisible.value = !isVisible.value;
  }
}