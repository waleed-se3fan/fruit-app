import 'package:flutter/cupertino.dart';

class FirstImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(height: double.infinity,
      child: Image.asset(
        'images/p7.jpg',fit: BoxFit.cover,),
    );
  }
}
