import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../controller.dart';
import '../../widgets/item-text.dart';
import 'components/categories.dart';
import 'components/categoryimage.dart';
import 'components/populardeals.dart';
import 'components/redapples.dart';
import 'components/search.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    int x;
  var controller = ProjectController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              controller.isPress
                  ? Icons.notifications_active_sharp
                  : Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              controller.isPress = !controller.isPress;
              setState(() {});
            },
          )
        ],
        automaticallyImplyLeading: false,
        title: MyText(
          text: '\nHand picked fresh\nitems only for you!',
          size: 22,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchComponent(),
                  CategoriesComponent(),
                  CategoryImageComponent(),
                  PopularDealsComponent(),
                  RedApplesComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
