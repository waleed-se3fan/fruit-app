import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/controller.dart';

import '../../../all.dart';
import '../../../widgets/item-text.dart';
import '../categoriesscreen/CategoriesScreen.dart';
import 'categories.dart';

class SearchComponent extends StatelessWidget {
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
        ListTile(
            title: MyText(
              text: 'Categories',
              color: Colors.black,
              size: 19,
            ),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return AllCategories(
                      'All Categories',
                      controller.vegetableImage +
                          controller.fruits +
                          controller.meat +
                          controller.dairy +
                          controller.beverages,
                      controller.vegetablename +
                          controller.fruitsname +
                          controller.meatname +
                          controller.dairyname +
                          controller.beveragesname,
                      controller.vegetabledetails +
                          controller.fruitsdetails +
                          controller.meatdetails +
                          controller.dairydetails +
                          controller.dairydetails +
                          controller.beveragesdetails);
                }));
              },
              child: MyText(
                text: 'See All',
                color: Colors.deepOrange,
                size: 15,
              ),
            )),
      ],
    );
  }
}
