import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectController {
  List<Map> tasks = [];
  var scaffoldkey = GlobalKey<ScaffoldState>();
   Database database;

  void createDatabase() async {
    database = await openDatabase('waleed.db', version: 1,
        onCreate: (database, version) {
      print('database created');
      database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, image TEXT,name TEXT)').then((value)
      {
        print('table created');
      }).catchError((error) {
        print('Error on creating table${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database).then((value) {
        tasks = value;
      });
      print('database opened');
    });
  }

  Future insertTODatabase({ String image,  String name}) {
    return database.transaction((txn) async {
      await txn
          .rawInsert('INSERT INTO tasks(image,name) VALUES("$image","$name")')
          .then((value) {
        print('$value inserted succefully');
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }

  int index = 0;
  int nav_index = 0;
  int currentDateSelectedIndex = 0;
  int val = 1;
  int apple_index = 0;
  int favourite_index = 0;
  int item_count = 4;
  int item_count1 = 8;
  int ind = 0;
  double checken_price = 3.10;
  double RedApples_price = 3.10;
  bool isPress = false;
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool isDetailsShown = true;
  int itemCount = 0;

  Map details = {
    'chicken':
        'Find recipes for fried chicken, chicken breast, grilled chicken, chicken wings, and more! Allrecipes has more than 5430 kitchen-approved chicken recipes',
    'red apples':
        'Red Delicious is a type of apple, first recognized in Madison County, Iowa, in 1872 that today comprises more than 50 cultivars. From 1968 to 2018, ...'
  };
  List images = [];
  final List added_images = [];
  final List added_names = [];

  List vegetableImage = [
    'images/potatos.png',
    'images/thom.jpg',
    'images/tomatos.png',
    'images/corn.png',
    'images/felfel.jpg'
  ];
  List vegetablename = ['potatos', 'thom', 'tomatos', 'corn', 'felfel'];
  List vegetabledetails = [
    'The potato is a starchy tuber of the plant Solanum tuberosum and is a root vegetable native to the Americas. The plant is a perennial in the nightshade ..',
    'Allium sativum is a perennial flowering plant growing from a bulb. It has a tall, erect flowering stem that grows up to 1 m (3 ft). The leaf blade is flat, ..',
    'tomato, (Solanum lycopersicum), flowering plant of the nightshade family (Solanaceae), cultivated extensively for its edible fruits. Labelled as a vegetable for nutritional purposes, tomatoes are a good source of vitamin C and the phytochemical lycopene.',
    'Maize also known as corn is a cereal grain first domesticated by indigenous peoples in southern Mexico about 10,000 years ago. The leafy stalk of the plant ..',
    'Felfel is what happens when trendy Antwerp and warm Lebanon meet. ... Stop by for a tasty lunch or coffee, or join us for a cosy evening with sharing plates and ..'
  ];
  List fruits = [
    'images/mango.jpg',
    'images/orange.jpg',
    'images/guava.jpg',
    'images/banana.jpg',
    'images/apple.jpg'
  ];
  List fruitsname = ['mango', 'orange.', 'guava', 'banana', 'apple'];
  List fruitsdetails = [
    'Description — A mango is an edible stone fruit produced by the tropical tree Mangifera indica which is believed to have originated from the region between ..',
    'Oranges are round orange-coloured fruit that grow on a tree which can reach 10 metres (33 ft) high. Orange trees have dark green shiny leaves and small white ..',
    'Guava (/ˈɡwɑːvə/) is a common tropical fruit cultivated in many tropical and subtropical regions. ... The common guava Psidium guajava (lemon guava, apple guava) ..',
    'Bananas are one of the most popular fruits worldwide. They contain essential nutrients that can have a protective impact on health. Eating bananas can help ..',
    'Apples are a popular fruit, containing antioxidants, vitamins, dietary fiber, and a range of other nutrients. Due to their varied nutrient content, they may help prevent several health conditions.'
  ];
  List meat = [
    'images/beef.jpg',
    'images/salamon.jpg',
    'images/ham.jpg',
    'images/kebebas.jpg',
    'images/fish.jpg'
  ];
  List meatname = ['beef', 'salamon', 'ham', 'kebebas', 'fish'];
  List meatdetails = [
    'Beef is the culinary name for meat from cattle (Bos taurus). In prehistoric times, humans hunted aurochs and later domesticated them',
    'SALOMON International: Sporting goods for men, women and children. Ski boots and clothing. Snowboarding, trail running and hiking clothes & shoes',
    'Ham is pork from a leg cut that has been preserved by wet or dry curing, with or without smoking. ... As a processed meat, the term "ham" includes both whole cuts ..',
    'Kebabs consist of cut up or ground meat, sometimes with vegetables, and various other accompaniments according to the specific recipe. Although kebabs are ..',
    'Fish are aquatic vertebrates. They usually have gills, paired fins, a long body covered with scales, and tend to be cold-blooded. “Fish” is a term used to ...'
  ];
  List dairy = [
    'images2/roumy.jpg',
    'images2/milk.jpg',
    'images2/butter.jpg',
    'images2/cheese.jpg',
    'images2/feta.jpg'
  ];
  List dairyname = ['roumy', 'milk', 'butter', 'cheese', 'feta'];
  List dairydetails = [
    'Egyptian Roumy Cheese ... The traditional Egyptian cheese is made from full cream cows'
        'milk, or from a mixture of cow and buffalo milk. The hard yellow cheese ..',
    'milk, liquid secreted by the mammary glands of female mammals to nourish their young for a period beginning immediately after birth',
    'Butterkäse ("butter cheese" in German) is a semi-soft, cow'
        's milk cheese moderately popular in Germanic Europe, and occasionally seen in the rest of the ..',
    'Cheese is a dairy product produced in wide ranges of flavors, textures and forms by coagulation of the milk protein casein. It comprises proteins and fat ..',
    'Feta (Greek: φέτα, féta) is a Greek brined curd white cheese made from sheep'
        's milk or from a mixture of sheep and goat'
        's milk. It is soft, with small or no ..'
  ];
  List beverages = [
    'images2/water.jpg',
    'images2/lemon.jpg',
    'images2/chocklete.jpg',
    'images2/soda.jpg',
    'images2/tea.jpg'
  ];
  List beveragesname = ['water', 'lemon', 'chocklete', 'soda', 'tea'];
  List beveragesdetails = [
    'Water is an inorganic, transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth'
        's hydrosphere and ..',
    'The lemon (Citrus limon) is a species of small evergreen trees in the flowering plant family Rutaceae, native to Asia, primarily Northeast India (Assam), ..',
    'Chocolate is made from tropical Theobroma cacao tree seeds. Its earliest use dates back to the Olmec civilization in Mesoamerica. After the European discovery ..',
    'The selfie camera that everyone'
        's been waiting for. Introducing Soda, the easy and effortless beauty camera. • The perfect combination of filters and makeu',
    'TEA has produced important updates and guidance to support school districts and charter schools. Texas Schools. Texas Schools. Visiting TEA'
  ];

  List tab_bar_names = ['Overview', 'Ingredienrs', 'Video', 'Recipe'];
  List favourites = [
    'Red apples\n1kg indian\n\$1.99',
    'Eggs\n1 dozzan,Local \n\$1.50',
    'Prawns\n1 kg,Fry \n\$2.10',
    'Chicken\n1 kg,with skin \n\$3.10',
  ];
  List days = [
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
  ];

  List listOfDays = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
  ];

  List vegetables = [
    'Vegetables',
    'Fruits',
    'Meat & fish',
    'Dairy & egg',
    'Beverates'
  ];
  List recipes = ['Breakfast', 'Lunch', 'Appetizers', 'Fast food', 'Soups'];

  List vegetables_images = [
    'images/0.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/6.jpg',
  ];
  List apples_images = [
    'images/11.jpg',
    'images/12.jpg',
    'images/13.jpg',
    'images/14.jpg',
  ];

  List recipes_images = [
    'images/21.jpg',
    'images/22.jpg',
    'images/23.jpg',
    'images/25.jpg',
  ];
  List checkout_title = [
    'Checkout',
    'Delivery',
    'Payment',
    'Promo Code',
    'Total Cost'
  ];
  List checkout_trailing = [
    '',
    'Select Method & Time  >',
    'Select Method  >',
    'Pick discount  >',
    '\$13.97  >'
  ];
  List dm = [
    'images/p6.jpg',
    'images2/w.jpg',
    'images/p1.jpg',
  ];






  Future<void> launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not launch $url';
    }
  }
  Future<void> makePhoneCall(String phoneNumber) async {

    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}









