import 'package:get/get.dart';

class PaymentController extends GetxController
{
  RxInt isSelected = 1.obs;
  void selectCardIndex(int index)
  {
    isSelected.value = index;
  }

}