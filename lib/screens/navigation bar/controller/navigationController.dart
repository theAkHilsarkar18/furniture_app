import 'package:furniture_shopping_app/screens/favourite/view/favouritescreen.dart';
import 'package:furniture_shopping_app/screens/home/view/homescreen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController
{
  RxInt navigationBarIndex = 0.obs;
  RxList screenList = [
    Homescreen(),
    FavouriteScreen(),
    Homescreen(),
    Homescreen(),
  ].obs;
}