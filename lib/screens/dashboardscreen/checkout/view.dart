import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller.dart';
import '../../../widgets/item-button.dart';
import '../../../widgets/item-text.dart';
import '../ordersummary/view.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var controller = ProjectController();
  var dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text('delivery address'),
            trailing: Text('change'),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Izazul islam',
                      )),
                  Divider(),
                  Text('38/A,3rd floor ,Dhanmodi 9A,Dhanmodi-123O,Dhaka.'),
                  Divider(),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('+8801754298028')),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Text('delivery Time'),
            trailing: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 18,
              elevation: 0,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                color: Colors.black,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['October', 'Mars', 'November', 'December']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.days.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      controller.currentDateSelectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.currentDateSelectedIndex == index
                            ? Colors.red
                            : Color(0xFFEEEEEE)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyText(
                          text: controller.listOfDays[index],
                          size: 16,
                          color: controller.currentDateSelectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                        MyText(
                          text: controller.days[index],
                          size: 16,
                          color: controller.currentDateSelectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyText(text: 'Time', size: 14, color: Colors.black),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        child:
                            MyText(text: '09 :', size: 15, color: Colors.black),
                      ),
                      Container(
                        child:
                            MyText(text: ' 41', size: 15, color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          controller.val1 = true;
                          controller.val2 = false;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: controller.val1
                                  ? Colors.deepOrange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: MyText(
                              text: 'AM',
                              size: 15,
                              color: controller.val1
                                  ? Colors.white
                                  : Colors.black87),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.val2 = true;
                          controller.val1 = false;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: controller.val2
                                  ? Colors.deepOrange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: MyText(
                              text: 'PM',
                              size: 15,
                              color: controller.val2
                                  ? Colors.white
                                  : Colors.black87),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            margin: const EdgeInsets.symmetric(horizontal: 35),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.red,
                      value: 0,
                      groupValue: controller.val,
                      onChanged: (x) {
                        controller.val = x as int;
                        setState(() {});
                      },
                    ),
                    Text(
                      'Door delivery',
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: .4,
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.red,
                      value: 2,
                      groupValue: controller.val,
                      onChanged: (x) {
                        controller.val = x as int;
                        setState(() {});
                      },
                    ),
                    Text(
                      'Pick up',
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyButton(
              data: 'Checkout',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrderSummaryScreen();
                }));
              })
        ],
      ),
    );
  }
}
