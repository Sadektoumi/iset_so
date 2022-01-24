import 'dart:io';

import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "welcome",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png"),
              ),
              Text("Welcome Honey",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
