import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fruit_app/screens/dashboardscreen/succesprder/view.dart';

import '../../../DB.dart';
import '../../../controller.dart';
import '../../../widgets/item-button.dart';
import '../../../widgets/item-text.dart';
import '../../favouritescreen/orderhistoryscreen/orderhistory.dart';
import '../checkout/view.dart';

class AddScreen extends StatefulWidget {
  AddScreen(this.image, this.productName, this.details);

  String image;
  String productName;
  String details;

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  var InfoController = TextEditingController();
  var PhoneController = TextEditingController();
  var acccountController = TextEditingController();
  var restController = TextEditingController();
  var idController = TextEditingController();
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                ),
                ListTile(
                  leading: MyText(
                      text: widget.productName,
                      size: 20,
                      color: Colors.black87),
                  trailing: IconButton(
                      onPressed: () {
                        controller.isPress = !controller.isPress;
                        setState(() {});
                      },
                      icon: Icon(
                        controller.isPress
                            ? Icons.favorite_outlined
                            : Icons.favorite_outline,
                        color: Colors.red,
                      )),
                ),
                Container(
                  child: Text(
                    '1 kg ,Indian',
                  ),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrange,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      controller.index <= 1
                                          ? controller.index == 0
                                          : controller.index--;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.remove_outlined,
                                      color: Colors.white,
                                    )),
                                MyText(
                                    text: '1', size: 15, color: Colors.white),
                                InkWell(
                                    onTap: () {
                                      controller.index++;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          )),
                      MyText(
                          text: '\$${controller.index}',
                          size: 20,
                          color: Colors.black)
                    ],
                  ),
                ),
                ListTile(
                  leading: MyText(
                    text: 'Product Details',
                    color: Colors.black,
                    size: 18,
                  ),
                  trailing: IconButton(
                    iconSize: 30,
                      onPressed: () {
                        controller.isDetailsShown =! controller.isDetailsShown;
                        setState(() {});
                      },
                      icon: Icon(controller.isDetailsShown?Icons.arrow_drop_down:Icons.arrow_drop_up)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child:controller.isDetailsShown? MyText(
                      text: widget.details, size: 13, color: Colors.black45):null,
                ),
                MyButton(
                  data: 'Add to cart',
                  onPressed: () {
                    DB.inserttoDataBase(
                      name: widget.productName,
                      lastN: widget.image,
                      Inforamtion: InfoController.text,
                      phoneN: PhoneController.text,
                      account: acccountController.text,
                      rest: restController.text,
                    );

                    setState(() {
                    });

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return SuccesOrderScreen();
                    })
                    );
                    //AddScreen(
                    //widget.image[index], widget.productName[index], widget.details[index])
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(50)),
            ),
            height: MediaQuery.of(context).size.height / 2.5,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
