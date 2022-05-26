import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller.dart';
import '../../../widgets/item-text.dart';
import '../redapples/view.dart';


class RedApplesComponent extends StatefulWidget{

  @override
  _RedApplesComponentState createState() => _RedApplesComponentState();
}

class _RedApplesComponentState extends State<RedApplesComponent> {
  var controller=ProjectController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        flex: 8,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddScreen('images/chicken.jpg','Chicken',controller.details['chicken']);}));},
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(top: 60,left: 15,right: 15),
                          margin: EdgeInsets.only(top: 40,bottom: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(text: 'Chicken', size: 16, color: Colors.black),
                              Text(
                                '1kg,with skin',
                              ),
                              Row(
                                children: [
                                  MyText(text:'\$${controller.checken_price}',color: Colors.black,size: 20,),
                                  Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange,),
                                      margin: const EdgeInsets.only(left: 35),
                                      child:  InkWell(onTap: (){controller.checken_price++;setState(() {

                                      });},child: Icon(Icons.add,color: Colors.white,)))
                                ],
                              )
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'images/chicken.jpg'),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddScreen('images/13.jpg','Red Apples',controller.details['red apples']);}));},
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(top: 60,left: 15,right: 15),
                          margin: EdgeInsets.only(top: 40,bottom: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(text: ' Red Apples', size: 16, color: Colors.black),
                              Text(
                                '1kg,indian',
                              ),
                              Row(
                                children: [
                                  MyText(text: '\$${controller.RedApples_price}',color: Colors.black,size: 20,),
                                  Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange,),
                                      margin: const EdgeInsets.only(left: 35),
                                      child: InkWell(onTap: (){controller.RedApples_price++;setState(() {

                                      });},child: Icon(Icons.add,color: Colors.white,)))
                                ],
                              )
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'images/11.jpg',
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
