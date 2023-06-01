import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/detail/controller/detailcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../controller/homecontroller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

HomeController homeController = Get.put(HomeController());

class _HomescreenState extends State<Homescreen> {
  DetailController detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // appbar search bar cart icon
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search,color: Colors.grey,size: 21.sp,),
                  Column(
                    children: [
                      Text(
                        'MAKE HOME',
                        style: GoogleFonts.overpass(
                            color: Colors.grey, fontSize: 10.sp),
                      ),
                      Text(
                        'BEAUTIFUL',
                        style: GoogleFonts.overpass(
                            color: Colors.black54,
                            fontSize: 14.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(onTap: () {
                    Get.toNamed('/cart');
                  },child: Icon(Icons.shopping_cart_outlined,color: Colors.grey,size: 20.sp,)),
                ],
              ),
            ),
            // category filter selected
            Stack(
              children: [
                Container(
                    height: 11.h,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => categoryBox(
                        homeController.categoryList[index],
                        homeController.categoryNameList[index],
                      ),
                      itemCount: homeController.categoryList.length,
                      scrollDirection: Axis.horizontal,
                    )),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  height: 11.h,
                  width: 20.w,
                  color: Colors.white,
                  child: favouriteBox(
                      Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      'Favourite'),
                ),
              ],
            ),
            // product grid view
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8,right: 8,top: 10),
                height: 68.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.grey,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9/16,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.toNamed('/detail');
                      detailController.productIndex.value = index;
                    },
                    child: productBox(
                      homeController.productList[index].productName!,
                      homeController.productList[index].productImg!,
                      homeController.productList[index].productPrice!,
                      homeController.productList[index].productRating!,
                    ),
                  ),
                  itemCount: homeController.productList.length,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget productBox(String pName, String pImg, String price, String rating) {
    return Container(
      //color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 2,),
          Stack(
            children: [
              Container(height: 26.h, width: 44.w, child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset('$pImg',fit: BoxFit.cover,))),
              Transform.translate(
                offset: Offset(16.h,45.w),
                child: Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_bag,color: Colors.black,size: 13.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h,),
          Container(
            width: 50.w,
            margin: EdgeInsets.only(left: 10, right: 10),
            //color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$pName',
                    style: GoogleFonts.overpass(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp)),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Text('\$ $price',
                        style: GoogleFonts.overpass(
                            color: Colors.black, fontWeight: FontWeight.bold,fontSize: 12.sp)),
                    Spacer(),
                    Text('$rating',
                        style: GoogleFonts.overpass(
                            color: Colors.black, fontWeight: FontWeight.w500,fontSize: 12.sp)),
                    Icon(Icons.star,size: 15.sp,color: Colors.amber,)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget favouriteBox(Icon i1, String name) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10),
            height: 6.h,
            width: 14.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: i1),
        Text(
          '$name',
          style: GoogleFonts.overpass(
              color: Colors.black, fontWeight: FontWeight.w500,fontSize: 10.sp),
        ),
      ],
    );
  }

  Widget categoryBox(Icon i1, String name) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10),
            height: 6.h,
            width: 14.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: i1),
        Text(
          '$name',
          style: GoogleFonts.overpass(
              color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 9.sp),
        ),
      ],
    );
  }
}
