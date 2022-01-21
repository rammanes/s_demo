import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDLoginScreen.dart';
import 'package:s_demo/widgets/app_widget.dart';

class SDWalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  @override
  _SDWalkThroughScreenState createState() => _SDWalkThroughScreenState();
}

class _SDWalkThroughScreenState extends State<SDWalkThroughScreen> {
  final PageController _controller = PageController();
  int counter = 0;
  static const _kDuration = const Duration(seconds: 1);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // page view widget controls the number of pages in the walk through
          PageView(
            controller: _controller,
            onPageChanged: (i) {
              counter = i;
              setState(() {});
            },
            children: [
              Column(
                children: [
                  freqWalkThroughImg(
                      'images/SDWalkThroughImg1.jpg', height * 0.7,
                      width: width, fit: BoxFit.cover),
                  20.height,
                  const Text(
                    SDWalkTitle1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: SDAppTextColorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      SDWalkSubTitle1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: SDAppTextColorSecondary,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  freqWalkThroughImg(
                      'images/SDWalkThroughImg2.jpg', height * 0.7,
                      width: width, fit: BoxFit.cover),
                  20.height,
                  const Text(
                    SDWalkTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: SDAppTextColorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      SDWalkSubTitle2,
                      style: TextStyle(
                        color: SDAppTextColorSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 90,
              child: Container(
                alignment: Alignment.center,
                width: width,
                child: DotsIndicator(
                  dotsCount: 2,
                  position: counter.toDouble(),
                  decorator: DotsDecorator(
                      activeSize: Size(18.0, 9.0),
                      size: Size.square(9.0),
                      color: SDGreyColor.withOpacity(0.5),
                      activeColor: SDColorPrimary,
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              )),
          Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        finish(context);
                        SDLoginScreen().launch(context);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: SDAppTextColorSecondary),
                      )),
                  TextButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: _kDuration, curve: _kCurve);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: SDAppTextColorSecondary),
                      ))
                ],
              ).visible(
                counter != 1,
                defaultWidget: Container(
                  margin: EdgeInsets.only(),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: elevatedButton((){SDLoginScreen().launch(context);}, "Get Started").defaultContainer(270, height: 40)),
                ),
              ))
        ],
      ),
    );
  }
}
