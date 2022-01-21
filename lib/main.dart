import 'package:flutter/material.dart';
import 'package:s_demo/screens/SDSplashScreen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // display the application splashscreen
      home: SDSplashScreen(),
    );
  }
}
