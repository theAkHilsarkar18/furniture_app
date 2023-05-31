import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/signin_signup/controller/signincontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  SigninController signinController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/signin/pattern.png'),
                SizedBox(height: 10,),
                Center(
                  child: Text(
                    'Hello!',
                    style: GoogleFonts.overpass(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'WELCOME BACK',
                    style: GoogleFonts.actor(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                // TODO textfield for email
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('Email',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width: 0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // TODO textfield for password
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextFormField(
                      controller: txtPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: signinController.isVisible.value,
                      obscuringCharacter: '#',
                      cursorColor: Colors.black,
                      style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: InkWell(onTap: () {
                          signinController.visibilityChangeOfPassword();
                        },child: signinController.isVisible.isFalse?Icon(Icons.visibility_off,color: Colors.grey):Icon(Icons.visibility,color: Colors.grey)),
                        label: Text('Password',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey,width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text('Forgot Password',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 14,letterSpacing: 1))),
                SizedBox(height: 20,),
                InkWell(onTap: () {
                  Get.offAndToNamed('/bar');
                },child: Container(padding: EdgeInsets.only(left: 10,right: 10),width: double.infinity,child: Image.asset('assets/signin/login.png',fit: BoxFit.cover,))),
                SizedBox(height: 20,),
                InkWell(onTap: () {
                  Get.toNamed('/signup');
                },child: Center(child: Text('Sign Up',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 14,letterSpacing: 1)))),
                SizedBox(height: 20,),
                Text('OR',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 10,letterSpacing: 1)),
                Image.asset('assets/signin/google.png',height: 60,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
