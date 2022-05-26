import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_app/controller.dart';
import 'package:fruit_app/screens/dashboardscreen/view.dart';
import '../DB.dart';
import '../main.dart';
import '../widgets/item-button.dart';
import '../widgets/item-text.dart';
import 'controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controller=ProjectController();
  @override
  void initState() {
    DB.createDataBase();
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return OnBoardingScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('images/splash.png'),
      ),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final contoller = PageViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyProjectScreen();
                }));
              },
              child: contoller.change == 0
                  ? Container()
                  : Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 13,
            child: PageView(
              onPageChanged: (index) {
                contoller.change = index;
                setState(() {});
              },
              children: List.generate(
                  contoller.images.length,
                  (index) => Image.asset(
                        contoller.images[contoller.change],
                        fit: BoxFit.fill,
                      )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: contoller.images.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        contoller.change = index;
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: contoller.change == index
                                ? Colors.red
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(25)),
                        height: 5,
                        width: contoller.change == index ? 30 : 10,
                      ),
                    );
                  }),
            ),
          ),
          MyText(
            text: contoller.title[contoller.change],
            size: 27,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            child: Text(
              contoller.subtitle[contoller.change],
              textAlign: TextAlign.center,
            ),
          ),
          MyButton(
              data: contoller.change == 0 ? 'Get Started' : 'Next',
              onPressed: () {
                if (contoller.change < contoller.images.length) {
                  contoller.change == 3
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return MyProjectScreen();
                        }))
                      : contoller.change++;
                  setState(() {});
                }
              }),
        ],
      ),
    );
  }
}
