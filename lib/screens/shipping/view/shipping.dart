import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/shipping/controller/shippingcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

ShippingController shippingController = Get.put(ShippingController());

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add,color: Colors.white),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Shipping address',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp)),
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Colors.black, size: 16.sp)),
        ),
        body: ListView.builder(itemBuilder: (context, index) => InkWell(onTap: () {
          shippingController.selectAddress(index+1);
        },child: addressBox(index+1)),itemCount: 3),
      ),
    );
  }

  Widget addressBox(int index)
  {
    return Container(
      height: 20.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 25,bottom: 10),
            child: Obx(
              () => Row(
                children: [
                  shippingController.isSelected.value==index?Text('$index.',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp)):Text('$index.',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp,color: Colors.grey)),
                  SizedBox(width: 1.w,),
                  shippingController.isSelected.value==index?Text('Use as the shipping address',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 13.sp)):Text('Use as the shipping address',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 13.sp,color: Colors.grey)),
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 15.sp,right: 15.sp),
              height: 12.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                 boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 8,spreadRadius: 3)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shippingController.isSelected.value==index?Text('Akhil Sodvadiya',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp)):Text('Akhil Sodvadiya',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp,color: Colors.grey)),
                  Divider(),
                  Spacer(),
                  Text('A-107, Khodiyar Chember, Anjani Nagar Society, Punagam, Surat - 395010',style: GoogleFonts.poppins(fontSize: 10.sp,color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
