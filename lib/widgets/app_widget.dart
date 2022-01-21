import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';

Widget placeHolderWidget() =>
    Image.asset('images/grey.jpg', fit: BoxFit.cover,);

placeHolderWidgetFn() async => (_, s) => placeHolderWidget();

Widget freqWalkThroughImg(String url, double height,
    {double? width, BoxFit? fit}) {
  if (url.startsWith('http')) {
    return CachedNetworkImage(
      placeholder: placeHolderWidgetFn(),
      imageUrl: '$url',
      height: height,
      width: width,
      fit: fit,
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit,);
  }
}

Widget logoContainer(){
  return Container(
    margin: EdgeInsets.only(top: 24),
    alignment: Alignment.topCenter,
    child: SvgPicture.asset(sdLogo, height: 140, width: 140,
    ),
  );
}
Widget  elevatedButton(Function () onPressed, String textItem)=> ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
      primary: SDColorPrimary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      )
  ),
  child: Text(textItem, style: TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold),),
);

Widget backButton(BuildContext context)=> Align(
  alignment: Alignment.topLeft,
  child: IconButton(onPressed: (){finish(context);}, icon: Icon(Icons.arrow_back, color: whiteColor, size: 24,)),
);
