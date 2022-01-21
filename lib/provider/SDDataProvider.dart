import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/models/SDModel.dart';


List<SDProductModel> getProductList(){
  List<SDProductModel> list = <SDProductModel>[];
  list.add(SDProductModel(id: 1, name: 'Shirts', category: 'Fashion',price: 90.0, image: shirts, isLiked: false, isSelected: false));
  list.add(SDProductModel(id: 1, name: 'Shoes', category: 'Fashion', price: 90.0,image: shoes, isLiked: false, isSelected: false));
  list.add(SDProductModel(id: 1, name: 'gadget', category: 'Gadgets',price: 90.0, image: gadgets, isLiked: false, isSelected: false));

  return list;
}