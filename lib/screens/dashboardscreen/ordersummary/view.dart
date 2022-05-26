import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../controller.dart';
import '../../../widgets/item-button.dart';
import '../../../widgets/item-text.dart';
import '../../../widgets/priceitem.dart';
import '../succesprder/view.dart';

class OrderSummaryScreen extends StatefulWidget {
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
var controller=ProjectController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: 'Order summary',
          color: Colors.black,
          size: 18,
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.recipes_images.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                    clipBehavior: Clip.antiAlias,
                    backgroundColor: Color(0xFFEEEEEE),
                    context: context,
                    builder: (context) {
                      return ModalButtonSheet();
                    });
                setState(() {});
              },
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
                          controller.recipes_images[index]),
                    ),
                    MyText(text: controller.favourites[index], size: 14, color: Colors.black),
                    PriceItem()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
class ModalButtonSheet extends StatefulWidget {

  @override
  _ModalButtonSheetState createState() => _ModalButtonSheetState();
}

class _ModalButtonSheetState extends State<ModalButtonSheet> {
  var controller =ProjectController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(flex: 6,
            child: ListView.separated(
                separatorBuilder: (context,index){return index==0?Container():Divider(height: 0,color: Colors.black54);},
                shrinkWrap: true,
                itemCount: controller.checkout_trailing.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: MyText(
                      text: controller.checkout_title[index],
                      color: Colors.black,
                      size: index==0?22:18,
                    ),
                    trailing: index == 0
                        ? IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.clear),color: Colors.black,)
                        : MyText(
                        text: controller
                            .checkout_trailing[index],
                        size: 13,
                        color: index == 4
                            ? Colors.deepOrange
                            : Colors.black54),
                  );
                }),
          ),
          Divider(),
          Expanded(
            child: Row(
              children: [
                Checkbox(
                    activeColor: Colors.green,
                    value: controller.val1,
                    onChanged: (v) {
                      controller.val1 = v;
                      setState(() {});
                    }),
                MyText(
                    text: 'By placing an order you agree to our\n Terms And Condtions',
                    size: 12,
                    color: Colors.black87)
              ],),
          ),
          Expanded(flex: 2,
            child: MyButton(
              data: 'Place Order', onPressed: (){ Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return SuccesOrderScreen();
                }));
            },
            ),
          )
        ],
      ),
    );
  }
}

