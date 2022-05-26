import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_app/screens/dashboardscreen/view.dart';
import 'package:fruit_app/screens/favouritescreen/orderhistoryscreen/orderhistory.dart';
import 'package:fruit_app/screens/favouritescreen/view.dart';
import 'package:fruit_app/screens/profilescreen/view.dart';

import 'DB.dart';
import 'controller.dart';
import 'onboarding/view.dart';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          color: Color(0xFFEEEEEE),
          elevation: 0,
    ),
      backgroundColor: Color(0xFFEEEEEE),
      scaffoldBackgroundColor: Color(0xFFEEEEEE),
    ),
    debugShowCheckedModeBanner: false,
    home: PageView(
      children: [SplashScreen(),
      ],
    ),
  ));
}
class MyProjectScreen extends StatefulWidget{
  @override
  _MyProjectScreenState createState() => _MyProjectScreenState();
}
class _MyProjectScreenState extends State<MyProjectScreen> {
  List<Map<dynamic, dynamic>> list = [];

  var controller=ProjectController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFEEEEEE),
            elevation: 0,
            currentIndex: controller.nav_index,
            onTap: (index){controller.nav_index=index;setState(() {});},
            selectedItemColor: Colors.deepOrange,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined),label: ''),
            ]),
        body:
        controller.nav_index==0? DashboardScreen():
        controller.nav_index==1?FavouriteScreen():
        controller.nav_index==2?OrderHistoryScreen(DB.elements):
        controller.nav_index==3?PageScreen():
        null
    );
  }
}
