import 'package:flutter/material.dart';

import 'data.dart';
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Food> foods = allFoods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlutterLogo(
            size: 100,
            style: FlutterLogoStyle.stacked,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 5),
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(),
              child: GestureDetector(
                onTap: () {},
                child: DraggableScrollableSheet(
                    initialChildSize: 0.3,
                    minChildSize: 0.1,
                    maxChildSize: 0.8,
                    builder: (context, controller) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: Colors.white70,
                            child: ListView.builder(
                                controller: controller,
                                itemCount: foods.length,
                                itemBuilder: (context, index) {
                                  final food = foods[index];

                                  return buildFood(food);
                                }),
                          ),
                        )),
              ))
        ],
      ),
    );
  }

  Widget buildFood(Food food) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(food.urlImage,
            width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(
        food.title,
        style: TextStyle(fontSize: 24),
      ),
      
    );
  }
}
