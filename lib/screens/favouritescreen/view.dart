import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import '../../DB.dart';
import '../../controller.dart';
import '../../widgets/item-text.dart';
import '../../widgets/priceitem.dart';
import 'orderhistoryscreen/orderhistory.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: 'My Favourite',
          color: Colors.black,
          size: 20,
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.item_count,
          itemBuilder: (context, index) {
            return index == controller.item_count1 ? Container() : Slidable(
              startActionPane:ActionPane(motion: Slidable(child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                        ),
                        borderRadius:
                        BorderRadius.circular(50)),
                    child: InkWell(
                      onTap: () {
                        controller.item_count1 = index;
                        controller.item_count--;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                        ),
                        borderRadius:
                        BorderRadius.circular(50)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return OrderHistoryScreen(
                                      DB.elements);
                                }));
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              )),
                  children:[]
              ) ,
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          controller.recipes_images[index]),),
                    MyText(text: controller.favourites[index],
                        size: 15,
                        color: Colors.black),
                    PriceItem()
                  ],
                ),
              ),
            );
          }),
    );
  }
}

