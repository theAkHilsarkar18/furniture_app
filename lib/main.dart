import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/detail/view/detailscreen.dart';
import 'package:furniture_shopping_app/screens/favourite/view/favouritescreen.dart';
import 'package:furniture_shopping_app/screens/home/view/homescreen.dart';
import 'package:furniture_shopping_app/screens/intro/view/introscreen.dart';
import 'package:furniture_shopping_app/screens/navigation%20bar/view/navigationbarscreen.dart';
import 'package:furniture_shopping_app/screens/signin_signup/view/signin.dart';
import 'package:furniture_shopping_app/screens/signin_signup/view/signup.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme()
        ),
        initialRoute: '/bar',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/',page: () => Introscreen(),),
          GetPage(name: '/signin',page: () => SigninScreen(),),
          GetPage(name: '/signup',page: () => SignupScreen(),),
          GetPage(name: '/home',page: () => Homescreen(),),
          GetPage(name: '/bar',page: () => NavigationbarScreen(),),
          GetPage(name: '/detail',page: () => Detailscreen(),),
          GetPage(name: '/fav',page: () => FavouriteScreen(),),
        ],
      ),
    ),
  );
}