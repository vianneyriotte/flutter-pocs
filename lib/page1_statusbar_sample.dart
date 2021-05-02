import 'package:flutter/material.dart';
import 'package:flutter_pocs/components/effects/effects.dart';
import 'package:flutter_pocs/components/pages/page_base.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          // PageBase.scrollableView(
          //   context,
          //   Padding(
          //     padding: EdgeInsets.all(10),
          //     child: Column(
          //       children: List.generate(
          //         nb,
          //         (index) => ListTile(
          //           title: Text("Titre ${index.toString()}"),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // _listNetworkImage(),
          _listCachedNetworkImage(),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {
                this.setState(() {
                  this.nb = 5;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _listCachedNetworkImage() {
    return PageBase.scrollableView(
      context,
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: List.generate(
            this.nb,
            (index) => Container(
              key: GlobalKey(),
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => FadeIn(
                  child: Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: 'https://picsum.photos/250?image=9',
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listNetworkImage() {
    return PageBase.scrollableView(
      context,
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: List.generate(
            this.nb,
            (index) => Container(
              key: GlobalKey(),
              child: FadeIn(
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
