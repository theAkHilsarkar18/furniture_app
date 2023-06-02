import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(onTap: () {
            Get.back();
          },child: Icon(Icons.arrow_back,size: 20.sp,color: Colors.black,)),
          centerTitle: true,
          title: Text('My orders',style: GoogleFonts.overpass(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15.sp)),
        ),
        body: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              Container(
                height: 5.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.grey,
                child: TabBar(
                  dividerColor: Colors.white,
                  automaticIndicatorColorAdjustment: true,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicator: UnderlineTabIndicator(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black, width: 2)),
                  labelStyle: GoogleFonts.poppins(fontSize: 11.sp,color: Colors.black,fontWeight:FontWeight.w600 ),
                  unselectedLabelStyle: GoogleFonts.poppins(fontSize: 10.sp),
                  tabs: const [
                    Tab(child: Text('Delivered')),
                    Tab(child: Text('Processing')),
                    Tab(child: Text('Canceled')),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 10.h,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    children: [
                      ListView.builder(itemBuilder: (context, index) => deliveredBox(Colors.green,'Delivered',Icon(Icons.done_all,color: Colors.grey,size: 17.sp,)),itemCount: 10,),
                      ListView.builder(itemBuilder: (context, index) => deliveredBox(Colors.amber,'Processing',Icon(Icons.watch_later_outlined,color: Colors.grey,size: 17.sp,)),itemCount: 10,),
                      ListView.builder(itemBuilder: (context, index) => deliveredBox(Colors.red,'Canceled',Icon(Icons.cancel_outlined,color: Colors.grey,size: 17.sp,)),itemCount: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container deliveredBox(Color c1, String status, Icon i1)
  {
    return Container(
      margin: EdgeInsets.only(left: 20.sp,right: 20.sp,top: 10.sp,bottom: 10.sp),
      height: 17.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 10,spreadRadius: 1)],

          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order No 235468912',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.sp)),
                Text('20/05/2023',style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 10.sp)),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Quantity : ',style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 12.sp)),
                    Text('03',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.sp)),
                  ],
                ),
                Row(
                  children: [
                    Text('Total : ',style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 12.sp)),
                    Text('\$ 231.20',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    height: 4.5.h,
                    width: 21.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('Detail',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12.sp,letterSpacing: 1)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    i1,
                    SizedBox(width: 1.w,),
                    Text('$status',style: GoogleFonts.overpass(color: c1,fontSize: 12.sp,fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,)
          ],
      )
    );
  }
}
