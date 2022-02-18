import 'package:flutter/material.dart';
import 'package:s_demo/authentication/auth.dart';
import 'package:s_demo/widgets/app_widget.dart';


class SDProfileScreen extends StatefulWidget {
  const SDProfileScreen({Key? key}) : super(key: key);

  @override
  _SDProfileScreenState createState() => _SDProfileScreenState();
}

class _SDProfileScreenState extends State<SDProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child:
          elevatedButton((){
            AuthenticationHelper().signOut();
          }, "Logout"),
      )
    ));
  }
}
