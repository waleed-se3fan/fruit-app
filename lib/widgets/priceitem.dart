import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller.dart';
import 'item-text.dart';

class PriceItem extends StatefulWidget{


  @override
  _PriceItemState createState() => _PriceItemState();
}

class _PriceItemState extends State<PriceItem> {
var controller=ProjectController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          InkWell(onTap: () {
            controller.itemCount++;
            setState(() {
            });
          }, child: Icon(Icons.add, color: Colors.white,)),
          MyText(text: '${controller.itemCount}',
              size: 15,
              color: Colors.white),
          InkWell(onTap: () {
            setState(() {
              controller.itemCount <= 1 ?
              controller.itemCount = 1 : controller.itemCount--;
            });
          }, child: Icon(Icons.remove_outlined, color: Colors.white,)),
        ],
      ),
    );
  }
}