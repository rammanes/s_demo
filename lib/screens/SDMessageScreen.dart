import 'package:flutter/material.dart';


class SDMessageScreen extends StatefulWidget {
  const SDMessageScreen({Key? key}) : super(key: key);

  @override
  _SDMessageScreenState createState() => _SDMessageScreenState();
}

class _SDMessageScreenState extends State<SDMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Text('Message under construction'),
    ));
  }
}
