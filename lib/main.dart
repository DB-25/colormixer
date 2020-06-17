import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double r = 1, g = 1, b = 1;
  Random _random = new Random();
  void randomBackground() {
    r = _random.nextDouble();
    g = _random.nextDouble();
    b = _random.nextDouble();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(
            255, (r * 255).floor(), (g * 255).floor(), (b * 255).floor()),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Color Mixer',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Red   '),
                  Slider(
                    value: r,
                    onChanged: (newValue) {
                      setState(() {
                        r = newValue;
                      });
                    },
                    activeColor: Colors.red,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Blue  '),
                  Slider(
                    value: b,
                    onChanged: (newValue) {
                      setState(() {
                        b = newValue;
                      });
                    },
                    activeColor: Colors.blue,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Green'),
                  Slider(
                    value: g,
                    onChanged: (newValue) {
                      setState(() {
                        g = newValue;
                      });
                    },
                    activeColor: Colors.green,
                  )
                ],
              ),
              Expanded(
                flex: 50,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      print('test');
                      setState(() {
                        randomBackground();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
