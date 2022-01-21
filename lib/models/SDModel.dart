import 'package:flutter/material.dart';


class SDProductModel{
  int? id;
  String? name;
  String? category;
  String? image;
  double? price;
  bool? isLiked;
  bool? isSelected;

  SDProductModel({this.id, this.name, this.category, this.image, this.price, this.isSelected=false, this.isLiked});
}