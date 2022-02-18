import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/authentication/auth.dart';
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
    final user = FirebaseAuth.instance.currentUser!;
    print(user);
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
                      Text('${user.displayName}', style: TextStyle(fontSize: 18, color: SDAppTextColorSecondary, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  10.width,
                  Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                        child: Icon(Icons.notifications, color: SDColorPrimary, size: 22,),
                        onTap: (){},
                      ),
                    ),
                  ),
                  Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                        child: Icon(Icons.logout, color: SDColorPrimary, size: 22,),
                        onTap: (){
                          AuthenticationHelper().signOut();
                        },
                      ),
                    ),
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

              20.height,
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
