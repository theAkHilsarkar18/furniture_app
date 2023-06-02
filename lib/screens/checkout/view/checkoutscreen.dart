import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Check out',style: GoogleFonts.overpass(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w500)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping address',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15.sp)),
                  InkWell(onTap: () {
                    Get.toNamed('/ship');
                  },child: Icon(Icons.edit_note_outlined,color: Colors.black,size: 22.sp,)),
                ],
              ),
            ),
            addressBox(),
            SizedBox(height: 2.h,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15.sp)),
                  InkWell(onTap: () {
                    Get.toNamed('/payment');
                  },child: Icon(Icons.edit_note_outlined,color: Colors.black,size: 22.sp,)),
                ],
              ),
            ),
            paymentBox(),
            SizedBox(height: 2.h,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery method',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15.sp)),
                  InkWell(onTap: () {
                    Get.toNamed('/payment');
                  },child: Icon(Icons.edit_note_outlined,color: Colors.black,size: 22.sp,)),
                ],
              ),
            ),
            deliveryBox(),
            SizedBox(height: 2.h,),
            totalBox(),
            Spacer(),
            checkoutBox(),
          ],
        ),
      ),
    );
  }


  Widget checkoutBox()
  {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
      height: 7.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text('Check out',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontSize: 13.sp)),
    );
  }

  Widget addressBox()
  {
    return Container(
      height: 14.h,
      width: MediaQuery.of(context).size.width,
      child: Container(
         padding: EdgeInsets.all(10),
         margin: EdgeInsets.only(left: 15.sp,right: 15.sp),
         height: 14.h,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Colors.white,
           boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 10,spreadRadius: 1)],
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Akhil Sodvadiya',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp)),
             Divider(),
             Text('A-107, Khodiyar Chember, Anjani Nagar Society, Punagam, Surat - 395010',style: GoogleFonts.poppins(fontSize: 10.sp,color: Colors.grey)),
           ],
         ),
       ),
    );
  }

  Widget paymentBox()
  {
    return Container(
      height: 11.h,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 15.sp,right: 15.sp),
        height: 14.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 10,spreadRadius: 1)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Axis',style: GoogleFonts.poppins(fontWeight: FontWeight.w700,color: Colors.red,fontSize: 15.sp)),
                Text('bank',style: GoogleFonts.poppins(color: Colors.black,fontSize: 15.sp)),
              ],
            ),
            Text('**** **** **** 8956',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 11.sp)),
          ],
        ),
      ),
    );
  }

  Widget deliveryBox()
  {
    return Container(
      height: 11.h,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 15.sp,right: 15.sp),
        height: 14.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 10,spreadRadius: 1)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Premium',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: Colors.amber,fontSize: 15.sp)),
            Text('Fast (2-3days)',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 11.sp)),
          ],
        ),
      ),
    );
  }

  Widget totalBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 15.sp,right: 15.sp),
      height: 17.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 10,spreadRadius: 1)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 13.sp)),
              Text('\$ 97.00',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 13.sp)),
              Text('\$ 5.00',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 13.sp)),
              Text('\$ 105.00',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 13.sp)),
            ],
          ),
        ],
      ),
    );
  }


}
