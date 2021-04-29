import 'package:flutter/material.dart';
import 'package:flutter_pocs/components/pages/page_base.dart';

class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int nb = 100;
  @override
  Widget build(BuildContext context) {
    return PageBase(
      statusBarColor: Colors.green,
      brightness: Brightness.dark,
      scrollable: false,
      appBar: AppBar(
        title: Text("OK"),
      ),
      child: Stack(
        children: [
          PageBase.scrollableView(
            context,
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: List.generate(
                  nb,
                  (index) => ListTile(
                    title: Text("Titre ${index.toString()}"),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {
                this.setState(() {
                  this.nb = 40;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
