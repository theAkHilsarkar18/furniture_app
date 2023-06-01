import 'package:furniture_shopping_app/screens/profile/model/profilemodel.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
{
  List<ProfileModal> profileMenuList = [
    ProfileModal(title: 'My orders',description: 'Already have 6 orders'),
    ProfileModal(title: 'Shipping address',description: '3 addresses'),
    ProfileModal(title: 'Payment method',description: 'You have 2 cards'),
    ProfileModal(title: 'My reviews',description: 'Reviews for 5 item'),
    ProfileModal(title: 'Setting',description: 'Notification,Password,FAQ,Contact'),
  ];
}
