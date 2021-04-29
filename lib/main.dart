import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pocs/page1_statusbar_sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              brightness: Brightness.dark,
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'POC',
      initialRoute: '/page1',
      routes: {
        '/page1': (context) => Page1(),
        // '/two': (context) => PageTwo(),
      },
    );
  }
}
