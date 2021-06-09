import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  MyHomePage(title: 'First Exercice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var colors = [Colors.indigo, Colors.deepOrangeAccent, Colors.amber, Colors.lightGreen, Colors.blue];
  var images = ['images/burger_icon.png', 'images/hotdog_icon.png', 'images/sandwich_icon.png', 'images/pizza_icon.png', 'images/cake_icon.png'];
  var titles = ['Featured', 'News', 'Best sellers', 'Most popular', 'In promotion'];
  var namesFood = ['Hamburger', "Hot-dogs", "Sandwich", "Pizza", "Cake"];

  var burgers = ['images/burger1.png', 'images/burger2.png', 'images/burger3.png', 'images/burger4.png'];
  var burgers_name = ['The Classic Phoenix Burger', 'The Yagoo Burger', 'The Kitten Special', 'Cheese Burger'];

  List<Widget> randomStars() {
    var random = new Random();
    int valRandom = random.nextInt(5);
    final List<Widget> stars = [];

    for (var i = 0; i < 5; i++) {
      if (i < valRandom) {
        stars.add(
          Icon(
            Icons.star,
            color: Colors.yellow,
          )
        );
      } else {
        stars.add(
          Icon(
            Icons.star_border,
            color: Colors.yellow,
          )
        );
      }
    }
    return stars;
  }

  int randomPrices(var number) {
    var random = new Random();
    return random.nextInt(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiara Fried Phoenix"),
        leading: Container(
          child: Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Container(
                child: Image.asset('images/kiara_avatar.png'),
              )
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "SEARCH FOR RECIPES :",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(26.0)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(26.0)
                  ),
                  filled: true,
                  hintText: "Search",
                  focusColor: Colors.red,
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          color: colors[position],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 30),
                                child: Image.asset(
                                  images[position],
                                  width: 60,
                                  height: 60
                                )
                              ),
                            ),
                            Align(
                              child: Text(namesFood[position]),
                            ),
                            Align(
                              child: Text(randomPrices(25).toString() + "\$"),
                            )
                          ]
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            titles[position],
                            textAlign: TextAlign.center,
                            style: position == 0 ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 20) : const TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.asset(
                              burgers[position],
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  burgers_name[position],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: Row(
                                  children: randomStars(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: Row(
                                  children: <Widget>[
                                    Text(randomPrices(15).toString() + "\$"),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0)
                                    ),
                                    Text(
                                      (randomPrices(15) + randomPrices(5)).toString() + "\$",
                                      style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              child: FloatingActionButton(
                                onPressed: (){},
                                backgroundColor: Colors.deepOrangeAccent,
                                child: Icon(Icons.add, color: Colors.white,)
                              ),
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
