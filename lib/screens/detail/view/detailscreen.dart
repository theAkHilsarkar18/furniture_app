import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/detail/controller/detailcontroller.dart';
import 'package:furniture_shopping_app/screens/home/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({Key? key}) : super(key: key);

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  HomeController homeController = Get.put(HomeController());
  DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 Padding(padding: EdgeInsets.only(left: 4.w,top: 2.h),child: InkWell(onTap: () {
                   Get.back();
                 },child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,size: 25.sp))),
                  Spacer(),
                  Obx(
                    () => Container(
                      height: 50.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(60)),
                        color: Colors.greenAccent,
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(60)),
                        child: Image.asset(
                          '${homeController.productList[detailController.productIndex.value].productImg}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(18.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // product name
                    Text(
                      '${homeController.productList[detailController.productIndex.value].productName}',
                      style: GoogleFonts.poppins(color: Colors.black,fontSize: 20.sp),
                    ),
                    //SizedBox(height: 1.h,),
                    // amount line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          '\$ ${homeController.productList[detailController.productIndex.value].productPrice}',
                          style: GoogleFonts.poppins(color: Colors.black,fontSize: 28.sp,fontWeight: FontWeight.w500),
                        ),
                        // inc dec row button
                        Container(
                          height: 5.h,
                          width: 35.w,
                          //color: Colors.black12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  detailController.incrementQuantity();
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 9.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                  child: Icon(Icons.add,color: Colors.black,size: 15.sp),
                                ),
                              ),
                              Obx(() => Text('${detailController.productQuantity.value}',style: TextStyle(fontSize: 17.sp,color: Colors.black,fontWeight: FontWeight.w500),)),
                              InkWell(
                                onTap: () {
                                  detailController.decrementQuantity();
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 9.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(Icons.remove_sharp,color: Colors.black,size: 15.sp,)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // rating
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: Colors.amber,size: 18.sp),
                        SizedBox(width: 2.w),
                        Text(
                          '${homeController.productList[detailController.productIndex.value].productRating}',
                          style: GoogleFonts.poppins(color: Colors.black,fontSize: 12.sp,fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '(43 reviews)',
                          style: GoogleFonts.poppins(color: Colors.grey,fontSize: 8.sp),
                        ),
                      ],
                    ),
                    // all detail paragraph
                    SizedBox(height: 1.h,),
                    Text(
                      '${detailController.detail.value}',
                      style: GoogleFonts.poppins(color: Colors.grey,fontSize: 10.sp),
                    ),
                    // save and add to cart box

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.bookmark_border,color: Colors.black45,size: 20.sp,),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Container(
                        height: 7.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text('Add to cart',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontSize: 13.sp)),
                      ),
                    ),
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
