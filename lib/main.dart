import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/cart/view/cartscreen.dart';
import 'package:furniture_shopping_app/screens/detail/view/detailscreen.dart';
import 'package:furniture_shopping_app/screens/favourite/view/favouritescreen.dart';
import 'package:furniture_shopping_app/screens/home/view/homescreen.dart';
import 'package:furniture_shopping_app/screens/intro/view/introscreen.dart';
import 'package:furniture_shopping_app/screens/myorder/view/myorderscreen.dart';
import 'package:furniture_shopping_app/screens/navigation%20bar/view/navigationbarscreen.dart';
import 'package:furniture_shopping_app/screens/profile/view/profilescreen.dart';
import 'package:furniture_shopping_app/screens/shipping/view/shipping.dart';
import 'package:furniture_shopping_app/screens/signin_signup/view/signin.dart';
import 'package:furniture_shopping_app/screens/signin_signup/view/signup.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // for device preview
  //enabled: !kReleaseMode,
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme()
        ),
        initialRoute: '/bar',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/',page: () => Introscreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/signin',page: () => SigninScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/signup',page: () => SignupScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/home',page: () => Homescreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/bar',page: () => NavigationbarScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/detail',page: () => Detailscreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/fav',page: () => FavouriteScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/cart',page: () => CartScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/profile',page: () => ProfileScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/order',page: () => MyOrderScreen(),transition: Transition.cupertinoDialog),
          GetPage(name: '/ship',page: () => ShippingScreen(),transition: Transition.cupertinoDialog),
        ],
      ),
    ),
  );
}