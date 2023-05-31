import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screens/home/controller/homecontroller.dart';
import 'package:furniture_shopping_app/screens/navigation%20bar/controller/navigationController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

HomeController homeController = Get.put(HomeController());
NavigationController navigationController = Get.put(NavigationController());
class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(onTap: () {
            navigationController.navigationBarIndex.value = 0;
          },child: Icon(Icons.arrow_back_outlined,color: Colors.black,size: 20.sp)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert,color: Colors.black,size: 20.sp),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Favourites',style: GoogleFonts.overpass(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w500)),
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
              child: Container(
                margin: EdgeInsets.all(10),
                height: 7.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('All add to my cart',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontSize: 13.sp)),
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
      height: 17.h,
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
                    style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12.sp),
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    '\$ ${price}',
                    style: GoogleFonts.poppins(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  SizedBox(height: 1.h,),
                  Icon(Icons.close),
                  SizedBox(height: 6.h,),
                  Icon(Icons.shopping_bag,color: Colors.black,),
                  SizedBox(height: 1.h,),
                ],
              ),
              SizedBox(width: 3.w,),
            ],
          ),
          SizedBox(height: 1.h,),
          Divider(),
        ],
      ),
    );
  }


}
