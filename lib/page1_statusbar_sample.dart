import 'package:flutter/material.dart';
import 'package:flutter_pocs/page_base.dart';

class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return PageBase(
        statusBarColor: Colors.green,
        brightness: Brightness.dark,
        scrollable: true,
        appBar: AppBar(
          title: Text("OK"),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: List.generate(
                100,
                (index) => ListTile(
                  title: Text("Titre ${index.toString()}"),
                ),
              ),
            ),
          ),
        ));
  }
}
