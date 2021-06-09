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

  var colors = [Color.fromRGBO(255, 233, 198, 1), Color.fromRGBO(194, 227, 254, 1), Color.fromRGBO(215, 250, 218, 1), Color.fromRGBO(253, 214, 213, 1), Color.fromRGBO(199, 184, 243, 1)];
  var images = ['images/burger.png', 'images/hotdog.png', 'images/sandwich.png', 'images/pizza.png', 'images/fries.png'];
  var titles = ['Featured', 'News', 'Best sellers', 'Most popular', 'In promotion'];
  var namesFood = ['Hamburger', "Hot-dogs", "Sandwich", "Pizza", "Frites"];

  var burgers_name = ['Delicious burger', 'Delicious hotdog', 'Delicious sandwich', 'Delicious pizza', 'Delicious fries'];

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
        leading: Container(
          child: Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Container(
                child: CircleAvatar(
                  child: Image.asset('images/tuxedo.png', height: 32),
                  backgroundColor: Color.fromRGBO(198, 231, 254, 1),
                ),
              )
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SEARCH FOR",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "RECIPES",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),

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
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 30),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: Image.asset(
                                      images[position],
                                      height: 40,
                                      width: 40
                                    ),
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Align(
                                child: Text(namesFood[position]),
                              ),
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 227, 223, 1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  images[position],
                                  width: 50,
                                  height: 50,
                                ),
                              ),
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
                                child: Icon(Icons.add, color: Colors.white)
                              ),
                              width: 32,
                              height: 32,
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
