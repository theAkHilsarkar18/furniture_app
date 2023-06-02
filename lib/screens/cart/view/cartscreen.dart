import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/cart/controller/cartcontroller.dart';
import 'package:furniture_shopping_app/screens/home/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeController homeController = Get.put(HomeController());
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('My cart',style: GoogleFonts.overpass(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w500)),
        ),
        body: Stack(
          children: [
            Container(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(itemBuilder: (context, index) => favouriteBox(
                homeController.productList[index].productImg!,
                homeController.productList[index].productName!,
                homeController.productList[index].productPrice!,
              ),itemCount: homeController.productList.length,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10,),
                    //margin: EdgeInsets.all(10),
                    height: 7.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total :',style: GoogleFonts.overpass(color: Colors.grey,fontWeight: FontWeight.w500,letterSpacing: 1,fontSize: 14.sp)),
                        Text('\$ 45.78',style: GoogleFonts.overpass(color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 1,fontSize: 14.sp)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/checkout');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      height: 7.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text('Check out',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontSize: 13.sp)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget favouriteBox(String img, String pname, String price)
  {
    return Container(
      margin: EdgeInsets.all(10),
      height: 18.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //color: Colors.black12
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 14.h,
                width: 30.w,
                child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset('${img}',fit: BoxFit.cover)),
              ),
              SizedBox(width: 4.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h,),
                  Text(
                    '${pname}',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12.sp),
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    '\$ ${price}',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                cartController.incrementQuantity();
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
                            Obx(() => Text('${cartController.productQuantity.value}',style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),)),
                            InkWell(
                              onTap: () {
                                cartController.decrementQuantity();
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
                ],
              ),
              Spacer(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.close,size: 20.sp,color: Colors.black),
              ),
              SizedBox(width: 1.w,),
            ],
          ),
          SizedBox(height: 1.h,),
          Divider(),
        ],
      ),
    );
  }
}
