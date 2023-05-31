import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/signin_signup/controller/signupcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Image.asset('assets/signin/pattern.png'),
              SizedBox(height: 30,),
              Center(
                child: Text(
                  'WELCOME',
                  style: GoogleFonts.actor(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1
                  ),
                ),
              ),
              SizedBox(height: 40,),
              // TODO textfield for name
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: txtName,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                    label: Text('Name',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
              // TODO textfield for password
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                      () => TextFormField(
                    controller: txtPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: signupController.isVisible.value,
                    obscuringCharacter: '#',
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: InkWell(onTap: () {
                        signupController.visibilityChangeOfPassword();
                      },child: signupController.isVisible.isFalse?Icon(Icons.visibility_off,color: Colors.grey):Icon(Icons.visibility,color: Colors.grey)),
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
              // TODO textfield for confirm password
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                      () => TextFormField(
                    controller: txtPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: signupController.isVisible.value,
                    obscuringCharacter: '#',
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: InkWell(onTap: () {
                        signupController.visibilityChangeOfPassword();
                      },child: signupController.isVisible.isFalse?Icon(Icons.visibility_off,color: Colors.grey):Icon(Icons.visibility,color: Colors.grey)),
                      label: Text('Confirm Password',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
              SizedBox(height: 30,),
              InkWell(onTap: () {
                Get.back();
              },child: Container(padding: EdgeInsets.only(left: 10,right: 10),width: double.infinity,child: Image.asset('assets/signin/signup.png',fit: BoxFit.cover,))),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account ? ',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 12,letterSpacing: 1)),
                    Text('Sign In',style: GoogleFonts.poppins(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500,letterSpacing: 1)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
