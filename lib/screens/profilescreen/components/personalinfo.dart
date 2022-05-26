import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller.dart';
import '../../../widgets/item-text.dart';

class PersonalInfo extends StatelessWidget{
  var controller=ProjectController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50))),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Expanded(flex:2,child: MyText(text: 'Waleed se3fan', size: 20, color: Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Projects'),
                  Text(
                    '7',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text('Frelancer'),

              Column(
                children: [
                  Text('Location'),
                  Text(
                    'Mansoura',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Expanded(flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(40)),
                      onPressed: () {
                        controller.launchInBrowser('https://www.facebook.com/profile.php?id=100006686705948');
                      },
                      child: Text('VIEW PROFILE'),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.deepOrange[800],
                      onPressed: () {
                        controller.makePhoneCall('01029673915');
                      },
                      child: Text(
                        'MESSAGE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 6,
            child: ListView(
              itemExtent: 135,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(3, (index) => Image.asset(controller.dm[index],fit: BoxFit.fitWidth,))
            ),
          ),


        ],
      ),
    );
  }
}
