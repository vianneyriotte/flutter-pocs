import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageBase extends StatelessWidget {
  static Color defaultStatusBarColor = Colors.blueGrey;
  static Brightness defaultBrightness = Brightness.dark;

  final Widget child;
  final Color statusBarColor;
  final Brightness brightness;
  final AppBar appBar;
  final bool scrollable;

  const PageBase({
    @required this.child,
    this.appBar,
    this.statusBarColor,
    this.brightness,
    this.scrollable = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bn = this.brightness == null ? defaultBrightness : this.brightness;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            bn == Brightness.dark ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            this.brightness == null ? defaultBrightness : this.brightness,
      ),
    );
    return Scaffold(
      appBar: appBar == null
          ? null
          : AppBar(
              leading: appBar.leading,
              title: appBar.title,
              actions: appBar.actions,
              brightness:
                  this.brightness == null ? defaultBrightness : this.brightness,
              backgroundColor: statusBarColor == null
                  ? defaultStatusBarColor
                  : statusBarColor,
            ),
      body: Container(
        color: statusBarColor == null ? defaultStatusBarColor : statusBarColor,
        child: SafeArea(
          bottom: false,
          child: Container(
            color: Colors.white,
            child: CustomScrollView(
              physics: scrollable
                  ? AlwaysScrollableScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
