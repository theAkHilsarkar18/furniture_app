import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/intro/controller/introcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({Key? key}) : super(key: key);

  @override
  State<Introscreen> createState() => _IntroscreenState();
}
IntroController introController = Get.put(IntroController());
class _IntroscreenState extends State<Introscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/intro/intro.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 40, right: 10,left: 10),
                  child: Text(
                    'MAKE YOUR HOME BEAUTIFUL',
                    style: GoogleFonts.actor(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Text('${introController.introDesc}',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12,letterSpacing: 1)),
                ),
                Spacer(),
                InkWell(onTap: () {
                  Get.offAndToNamed('/signin');
                },child: Image.asset('assets/intro/Button.png')),
                Image.asset('assets/intro/Indicator.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
