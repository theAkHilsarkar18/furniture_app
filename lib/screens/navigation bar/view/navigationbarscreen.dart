import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/home/view/homescreen.dart';
import 'package:furniture_shopping_app/screens/navigation%20bar/controller/navigationController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../favourite/view/favouritescreen.dart';

class NavigationbarScreen extends StatefulWidget {
  const NavigationbarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationbarScreen> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreen> {
  NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 55.h,
                  child: FavouriteScreen()),
            ),
            Obx(() => navigationBar()),
          ],
        ),
      ),
    );
  }

  Container navigationBar()
  {
    return Container(
      height: 8.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(onTap: () {
            navigationController.navigationBarIndex.value = 0;
          },child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home_outlined,size: navigationController.navigationBarIndex.value==0?30:25,color: navigationController.navigationBarIndex==0?Colors.black87:Colors.grey),
              SizedBox(height: 1,),
              Text('Home',style: GoogleFonts.overpass(fontSize: 12,color: navigationController.navigationBarIndex==0?Colors.black87:Colors.grey)),
            ],
          ),),

          InkWell(onTap: () {
            navigationController.navigationBarIndex.value = 1;

          },child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bookmark_border,size: navigationController.navigationBarIndex.value==1?30:25,color: navigationController.navigationBarIndex==1?Colors.black87:Colors.grey,),
              SizedBox(height: 1,),
              Text('Favourite',style: GoogleFonts.overpass(fontSize: 12,color: navigationController.navigationBarIndex==1?Colors.black87:Colors.grey)),
            ],
          )),
          InkWell(onTap: () {
            navigationController.navigationBarIndex.value = 2;

          },child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.sell_outlined,size:navigationController.navigationBarIndex.value==2?30:25,color: navigationController.navigationBarIndex==2?Colors.black87:Colors.grey,),
              SizedBox(height: 1,),
              Text('Offer',style: GoogleFonts.overpass(fontSize: 12,color: navigationController.navigationBarIndex==2?Colors.black87:Colors.grey)),
            ],
          )),
          InkWell(onTap: () {
            navigationController.navigationBarIndex.value = 3;

          },child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_outline_outlined,size: navigationController.navigationBarIndex.value==3?30:25,color: navigationController.navigationBarIndex==3?Colors.black87:Colors.grey,),
              SizedBox(height: 1,),
              Text('Profile',style: GoogleFonts.overpass(fontSize: 12,color: navigationController.navigationBarIndex==3?Colors.black87:Colors.grey)),
            ],
          )),
        ],
      ),
    );
  }

}
