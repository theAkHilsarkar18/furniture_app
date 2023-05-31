import 'package:get/get.dart';

class CartController extends GetxController
{
  RxInt productQuantity = 1.obs;
  RxInt productIndex = 0.obs;

  void incrementQuantity()
  {
    productQuantity.value++;
  }

  void decrementQuantity()
  {
    if(productQuantity.value > 0)
    {
      productQuantity.value--;
    }
  }
}