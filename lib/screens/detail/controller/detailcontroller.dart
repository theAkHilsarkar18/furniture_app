import 'package:get/get.dart';

class DetailController extends GetxController
{
  RxInt productIndex = 0.obs;
  RxInt productQuantity = 1.obs;

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

  RxString detail = 'A product detail page (PDP) is a web page that outlines everything customers and buyers need to know about a particular product — including information about color, sizing, material, pricing, shipping options, and more'.obs;

}