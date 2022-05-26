import 'package:flutter/cupertino.dart';

class CategoryImageComponent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(50)),
        clipBehavior: Clip.antiAlias,
        child: Image.asset('images/7.jpg',fit: BoxFit.fill,),
      ),
    );
  }
}
