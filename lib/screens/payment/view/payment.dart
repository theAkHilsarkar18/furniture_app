import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/payment/controller/paymentcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

PaymentController paymentController = Get.put(PaymentController());
class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {

        },child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.black,),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Payment method',
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
          paymentController.selectCardIndex(index+1);
        },child: paymentBox(index+1)),itemCount: 5,),
      ),
    );
  }

  Widget paymentBox(int index)
  {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 30,top:30 ),
          child: Obx(
                () => Row(
              children: [
                paymentController.isSelected.value==index?Text('$index.',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 14.sp)):Text('$index.',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 14.sp,color: Colors.grey)),
                SizedBox(width: 1.w,),
                paymentController.isSelected.value==index?Text('Use as default payment method',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.sp)):Text('Use as the shipping address',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.grey)),
                paymentController.isSelected.value==index?Text('Use as default payment method',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.sp)):Text('Use as the shipping address',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.grey)),
              ],
            ),
          ),
        ),
        Container(
          height: 25.h,
          width: 87.w,
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            //color: Colors.white,
            boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 10,spreadRadius: 1)],

          ),
          child: Stack(
            children: [
              Image.asset('assets/payment/card1.png',fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 2.h,width:20.w,child: Image.asset('assets/payment/visa.png')),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Axis',style: GoogleFonts.poppins(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 15.sp)),
                        Text('bank',style: GoogleFonts.poppins(color: Colors.white,fontSize: 15.sp)),
                      ],
                    ),
                    SizedBox(width: 2.w,),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('PLATINUM',style: GoogleFonts.robotoMono(color: Colors.grey.shade50,fontSize: 14.sp,wordSpacing: 10)),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, 110),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5520 1233 5623 9800',style: GoogleFonts.robotoMono(color: Colors.grey.shade100,fontSize: 15.sp,wordSpacing: 5)),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, 150),
                child: Row(
                  children: [
                    SizedBox(width: 5.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NAME',style: GoogleFonts.overpass(color: Colors.grey.shade100,fontSize: 5.sp)),
                        Text('TheAkhilSarkar',style: GoogleFonts.robotoMono(color: Colors.grey.shade100,fontSize: 11.sp)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('VALID FROM',style: GoogleFonts.overpass(color: Colors.grey.shade100,fontSize: 5.sp)),
                        Text('10/17',style: GoogleFonts.robotoMono(color: Colors.grey.shade100,fontSize: 11.sp,wordSpacing: 10)),
                      ],
                    ),
                    SizedBox(width: 2.w,),
                    Column(
                      children: [
                        Text('VALID THRU',style: GoogleFonts.overpass(color: Colors.grey.shade100,fontSize: 5.sp)),
                        Text('10/27',style: GoogleFonts.robotoMono(color: Colors.grey.shade100,fontSize: 11.sp,wordSpacing: 10)),
                      ],
                    ),
                    SizedBox(width: 5.w,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

}
