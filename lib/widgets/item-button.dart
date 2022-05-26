import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  Function onPressed;
  String data;
  MyButton({ this.data, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          return onPressed();
        },
        color: Colors.deepOrange[700],
        minWidth: double.infinity,
        child: Text(data,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
