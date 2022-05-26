
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller.dart';
import '../../../widgets/item-text.dart';
import '../populardeals/view.dart';

class PopularDealsComponent extends StatefulWidget {
  @override
  _PopularDealsComponentState createState() => _PopularDealsComponentState();
}

class _PopularDealsComponentState extends State<PopularDealsComponent> {
  var controller = ProjectController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MyText(
        text: 'Popular Deals',
        size: 20,
        color: Colors.black,
      ),

    );
  }
}
