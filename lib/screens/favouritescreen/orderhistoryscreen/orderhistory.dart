import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fruit_app/widgets/item-button.dart';
import 'package:sqflite/sqflite.dart';

import '../../../DB.dart';
import '../../../controller.dart';
import '../../../main.dart';
import '../../../widgets/item-text.dart';
import '../../../widgets/priceitem.dart';
import '../../dashboardscreen/succesprder/view.dart';
import '../../dashboardscreen/view.dart';

class OrderHistoryScreen extends StatefulWidget {
  List<Map<dynamic, dynamic>> list = [];

  OrderHistoryScreen(this.list);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState(this.list);
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  var controller = ProjectController();
  List<Map<dynamic, dynamic>> list = [];



  _OrderHistoryScreenState(this.list);

  int t = 1;
  double o = 1;
  int r = 1;
  int b = 1;
  int g = 1;
  double a = 60;
  double a1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Order history',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      )),
      body: list.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/empty.png'),
                MyText(
                    text: 'Your Cart is empty',
                    size: 21,
                    color: Colors.black87),
                Text(
                    'You have no items in your shopping cart.\n               Let,s go buy something '),
                MyButton(
                    data: 'SHOP NOW',
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) {
                        return MyProjectScreen();
                      }));
                    })
              ],
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child:Dismissible(
                    onDismissed: (direction){
                      DB.DeleteFromDataBase(id:list[index]['id']);
                    },
                    key: Key(list[index]['id'].toString()),
                    child: Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          title: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage(list[index]['lastN']),
                          ),
                          trailing: MyText(
                              text: list[index]['name'],
                              size: 15,
                              color: Colors.black),
                        )),
                  ),
                );
              },
            ),
    );
  }
}



