import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/screens/dashboardscreen/redapples/view.dart';

import '../../../controller.dart';
import '../../../widgets/item-text.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen(this.categoryname, this.images, this.imagesname,this.details);

  String categoryname = '';
  List images;
  List imagesname;
  List details;
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: widget.categoryname, size: 18, color: Colors.black),
      ),
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
          Expanded(
            flex: 6,
            child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {

                      });

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) {
                        return AddScreen(
                            widget.images[index], widget.imagesname[index], widget.details[index]);
                      }));
                    },
                    child: Container(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            padding:
                                EdgeInsets.only(top: 60, left: 15, right: 15),
                            margin: EdgeInsets.only(
                                top: 40, left: 10, right: 10, bottom: 05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                    text: widget.imagesname[index],
                                    size: 16,
                                    color: Colors.black),
                                Text(
                                  '1kg,with skin',
                                ),
                                MyPriceItem()
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(widget.images[index]),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class MyPriceItem extends StatefulWidget {
  @override
  _MyPriceItemState createState() => _MyPriceItemState();
}

class _MyPriceItemState extends State<MyPriceItem> {
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(
          text: '\$${controller.checken_price}',
          color: Colors.black,
          size: 20,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrange,
            ),
            margin: const EdgeInsets.only(left: 60),
            child: InkWell(
                onTap: () {
                  controller.checken_price++;
                  setState(() {});
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )))
      ],
    );
  }
}
