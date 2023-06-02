import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../model/homemodel.dart';

class HomeController extends GetxController
{
  List<Icon> categoryList = [
    Icon(Icons.chair_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.bed_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.weekend_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.light,color: Colors.grey,size: 20.sp),
    Icon(Icons.grass_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.bathtub_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.dining_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.window_outlined,color: Colors.grey,size: 20.sp),
    Icon(Icons.tv,color: Colors.grey,size: 20.sp),
  ];

  List categoryNameList = [
    'Chair',
    'Bed',
    'Armchair',
    'Lights',
    'Trees',
    'Bathroom',
    'Kitchen',
    'Window',
    'TV',
  ];

  /// product list

  List<HomeModel> productList = [
    HomeModel(productImg:'assets/product/sofa2.jpeg',productName: 'Hall Sofa',productPrice: '12.00',productRating: '4.8' ),
    HomeModel(productImg:'assets/product/tree1.jpeg',productName: 'Small Tree Plants',productPrice: '12.00' ,productRating: '4.8'),
    HomeModel(productImg:'assets/product/bed3.webp',productName: 'Bed Decoration',productPrice: '12.00' ,productRating: '4.8'),
    HomeModel(productImg:'assets/product/lamp2.avif',productName: 'Stand Lamp',productPrice: '12.00',productRating: '4.8' ),
    HomeModel(productImg:'assets/product/kitchen.jpeg',productName: 'Kitchen Wear',productPrice: '12.00' ,productRating: '4.8'),
    HomeModel(productImg:'assets/product/window.webp',productName: 'Window Look',productPrice: '25.00',productRating: '4.8' ),
    HomeModel(productImg:'assets/product/bed.jpeg',productName: 'Bed',productPrice: '25.00',productRating: '4.5' ),
    HomeModel(productImg:'assets/product/tree2.jpeg',productName: 'Tree Plant',productPrice: '25.00',productRating: '4.8' ),
    HomeModel(productImg:'assets/product/bed2.jpeg',productName: 'Bed',productPrice: '12.00' ,productRating: '4.8'),
    HomeModel(productImg:'assets/product/sofa.jpeg',productName: 'Yellow Sofa',productPrice: '12.00' ,productRating: '4.8'),
  ];

}