import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../main.dart';
import '../../../widgets/item-text.dart';

class SuccesOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
                'images/succes.png'),
            MyText(text:'Your order has been \n placed successfully',color: Colors.black,size: 20,),
            Text('your items has been placed and is \n on it;s way to being processed'),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepOrange,
              ),
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return MyProjectScreen();}));},
                minWidth: double.infinity,
                child: Text('Continue Shopping', style: TextStyle(color: Colors.white))
              ),
            ),],
        ),
      ),
    );
  }
}
