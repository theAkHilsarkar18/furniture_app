import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shopping_app/screens/home/controller/homecontroller.dart';
import 'package:furniture_shopping_app/screens/review/controller/reviewcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

HomeController homeController = Get.put(HomeController());
ReviewController reviewController = Get.put(ReviewController());
class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(onTap: () {
            Get.back();
          },child: Icon(Icons.arrow_back,size: 20.sp,color: Colors.black,)),
          centerTitle: true,
          title: Text('My reviews',style: GoogleFonts.overpass(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15.sp)),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(itemBuilder: (context, index) => reviewBox(
          homeController.productList[index].productImg!,
          homeController.productList[index].productName!,
          homeController.productList[index].productPrice!,
          homeController.productList[index].productRating!,
        ),itemCount: homeController.productList.length,),
      ),
    );
  }

  Widget reviewBox(String img, String name, String price,String rating,)
  {
    return Container(
      margin: EdgeInsets.all(20),
      height: 30.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [ BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 8,spreadRadius: 3)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 10.h,
                width: 25.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset('$img',fit: BoxFit.cover,)),
              ),
              SizedBox(width: 2.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$name',style: GoogleFonts.poppins(color: Colors.black,fontSize: 13.sp,letterSpacing: 1)),
                  Text('\$ $price',style: GoogleFonts.poppins(color: Colors.black,fontSize: 13.sp,letterSpacing: 1,fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 5),
            child: Row(
              children: [
                Text('$rating',style: GoogleFonts.poppins(color: Colors.black,fontSize: 13.sp,letterSpacing: 1,fontWeight: FontWeight.w600)),
                SizedBox(width: 1.w,),
                Icon(Icons.star,color: Colors.amber,size: 17.sp,),
                Icon(Icons.star,color: Colors.amber,size: 17.sp,),
                Icon(Icons.star,color: Colors.amber,size: 17.sp,),
                Icon(Icons.star,color: Colors.amber,size: 17.sp,),
                Icon(Icons.star,color: Colors.amber,size: 17.sp,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('${reviewController.review}',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 9.sp)),
          ),
        ],
      ),
    );
  }

}
