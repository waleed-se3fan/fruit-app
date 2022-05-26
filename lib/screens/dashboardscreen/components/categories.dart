import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/screens/dashboardscreen/categoriesscreen/CategoriesScreen.dart';

import '../../../controller.dart';

class CategoriesComponent extends StatelessWidget {
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.vegetables_images.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return CategoriesScreen(i == 0
                    ? 'Vegetable'
                    : i == 1
                        ? 'Fruits'
                        : i == 2
                            ? 'Meat & Fish'
                            : i == 3
                                ? 'Dairy & Eggs'
                                : i == 4
                                    ? 'Beverates'
                                    : 'Categories',
                    i == 0
                        ? controller.vegetableImage:i == 1
                        ? controller.fruits:i == 2
                        ? controller.meat:i == 3
                        ? controller.dairy:i == 4
                        ? controller.beverages:
                         controller.images,


                    i == 0
                        ? controller.vegetablename:i == 1
                        ? controller.fruitsname:i == 2
                        ? controller.meatname:i == 3
                        ? controller.dairyname:i == 4
                        ? controller.beveragesname:
                    controller.images,
                    i == 0
                        ? controller.vegetabledetails:i == 1
                        ? controller.fruitsdetails:i == 2
                        ? controller.meatdetails:i == 3
                        ? controller.dairydetails:i == 4
                        ? controller.beveragesdetails:
                    controller.images

                );
              }));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(controller.vegetables_images[i]),
                    fit: BoxFit.fitHeight),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: Colors.deepOrange[700],
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    margin: const EdgeInsets.only(top: 70),
                  ),
                  Container(
                    color: Colors.deepOrange[700],
                    child: Text(
                      controller.vegetables[i],
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
