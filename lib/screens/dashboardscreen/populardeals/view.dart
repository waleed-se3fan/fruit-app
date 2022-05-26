import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller.dart';
import '../../../widgets/item-text.dart';


class PopularDealsScreen extends StatefulWidget{
  @override
  _PopularDealsScreenState createState() => _PopularDealsScreenState();
}

class _PopularDealsScreenState extends State<PopularDealsScreen> {
  var controller=ProjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyText(text: 'Popular Deals', size: 18, color: Colors.black),),
      body: Column(
        children: [
          Expanded(
            child: ListTile(
              leading: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for Anything',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              trailing: Icon(
                Icons.menu_open_sharp,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(flex: 6,
            child: GridView.builder(itemCount: controller.recipes_images.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                itemBuilder: (context, index) {
                  return Container(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(top: 60,left: 15,right: 15),
                          margin: EdgeInsets.only(top: 40,left: 10,right: 10,bottom: 05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(text: controller.recipes[index], size: 16, color: Colors.black),
                              Text(
                                '1kg,with skin',
                              ),
                              MyPriceItem()
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              controller.recipes_images[index]),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
class MyPriceItem extends StatefulWidget{


  @override
  _MyPriceItemState createState() => _MyPriceItemState();
}

class _MyPriceItemState extends State<MyPriceItem> {
  var controller=ProjectController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(text:'\$${controller.checken_price}',color: Colors.black,size: 20,),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange,),
            margin: const EdgeInsets.only(left: 60),
            child:  InkWell(onTap: (){controller.checken_price++;setState(() {

            });},child: Icon(Icons.add,color: Colors.white,)))
      ],
    );
  }
}