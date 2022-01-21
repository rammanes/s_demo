import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';

extension WidgetExtension on Widget{
  Future launch<T>(BuildContext context, {bool isNewTask = false}) async{
    if(this is StatefulWidget || this is StatelessWidget){
      if(isNewTask){
        return await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=> this), (route) => route == null);
      }else{
        return await Navigator.of(context).push(MaterialPageRoute<T>(builder: (_)=> this));
      }
    }else{
      throw Exception('This ought be a stateless or stateful widget');
    }
  }

  Widget visible(bool visible , {Widget? defaultWidget})
    => visible ? this: defaultWidget ?? SizedBox();

  Widget backgroundContainer(double height, double width){
    return Container(
      margin: EdgeInsets.only(top: 200),
      height: height,
      width: width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: whiteColor),
      child: this,
    );
  }

  // default container with set width and optional height parameter
  Widget defaultContainer(double width, {double? height}){
    return Container(
      width: width,
      child: this,
    );
  }

  // add expand to parent widget
  Widget expand({flex = 1})=> Expanded(child: this, flex: flex,);

}