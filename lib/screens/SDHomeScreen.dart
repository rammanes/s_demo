import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/models/SDModel.dart';
import 'package:s_demo/provider/SDDataProvider.dart';
import 'package:s_demo/widgets/app_widget.dart';


class SDHomeScreen extends StatefulWidget {
  static String tag = '/HomeScreen';

  @override
  _SDHomeScreenState createState() => _SDHomeScreenState();
}

class _SDHomeScreenState extends State<SDHomeScreen> {

  late List<SDProductModel> sdProductList;
  
  
  @override 
  void initState(){
    super.initState();
    sdProductList = getProductList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Hi', style: TextStyle(fontSize: 18, color: SDAppTextColorSecondary, fontWeight: FontWeight.bold),),
                      8.width,
                      Text('Achenyo, A.', style: TextStyle(fontSize: 18, color: SDAppTextColorSecondary, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  GestureDetector(
                    child: Icon(Icons.notifications, color: SDColorPrimary, size: 22,),
                    onTap: (){},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        hintText: 'search',
                        prefixIcon: Icon(Icons.search, color: SDGreyColor,),
                        hintStyle: TextStyle(color: SDGreyColor),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: SDAppDividerColor, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: SDAppDividerColor, width: 0.5),
                        ),
                      ),
                    ),
                  ).expand(),
                  8.width,
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 14),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: SDAppDividerColor, width: 0.5)
                    ),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_list, color: SDGreyColor,)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Products', style: TextStyle(fontSize: 16, color: SDAppTextColorPrimary, fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){},
                    child: Text('View all', style: TextStyle(fontSize: 14, color: SDColorPrimary, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              20.height,
              Container(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: sdProductList.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){},
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
                        shadowColor: SDGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: freqWalkThroughImg(sdProductList[index].image!, 110, width: 120, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(sdProductList[index].name!, style: TextStyle(fontSize: 16, color: SDAppTextColorPrimary, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text( '\$ ${sdProductList[index].price!}',  style: TextStyle(fontSize: 12, color: SDAppTextColorSecondary),
                            ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Products', style: TextStyle(fontSize: 16, color: SDAppTextColorPrimary, fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){},
                    child: Text('View all', style: TextStyle(fontSize: 14, color: SDColorPrimary, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              16.height,
              Container(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: sdProductList.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){},
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
                        shadowColor: SDGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: freqWalkThroughImg(sdProductList[index].image!, 110, width: 120, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(sdProductList[index].name!, style: TextStyle(fontSize: 16, color: SDAppTextColorPrimary, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text( '\$ ${sdProductList[index].price!}',  style: TextStyle(fontSize: 12, color: SDAppTextColorSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
