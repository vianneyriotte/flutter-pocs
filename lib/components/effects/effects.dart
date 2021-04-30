import 'dart:async';

import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final int delay;
  final AnimationController controller;

  FadeIn({@required this.child, this.delay, this.controller});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with TickerProviderStateMixin {
  AnimationController _animController;

  @override
  void initState() {
    super.initState();

    _animController = this.widget.controller == null
        ? AnimationController(
            vsync: this,
            duration: Duration(milliseconds: this.widget.delay ?? 800),
          )
        : this.widget.controller;

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        try {
          _animController.forward();
        } catch (_) {}
      });
    }
  }

  @override
  void dispose() {
    if (this.widget.controller == null) _animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: widget.child,
      opacity: _animController,
    );
  }
}

class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;
  final AnimationController controller;

  ShowUp({@required this.child, this.delay, this.controller});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  Animation<Offset> _animOffset;

  AnimationController _animController;

  @override
  void initState() {
    super.initState();

    _animController = this.widget.controller == null
        ? AnimationController(
            vsync: this,
            duration: Duration(milliseconds: this.widget.delay ?? 800),
          )
        : this.widget.controller;

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.50), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        try {
          _animController.forward();
        } catch (_) {}
      });
    }
  }

  @override
  void dispose() {
    if (this.widget.controller == null) _animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}

class ShowRight extends StatefulWidget {
  final Widget child;
  final int delay;
  final AnimationController controller;
  ShowRight({@required this.child, this.delay, this.controller});

  @override
  _ShowRightState createState() => _ShowRightState();
}

class _ShowRightState extends State<ShowRight> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = this.widget.controller == null
        ? AnimationController(
            vsync: this, duration: Duration(milliseconds: 800))
        : this.widget.controller;
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(-0.50, 0.0), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (this.widget.controller == null) _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}

class ShowLeft extends StatefulWidget {
  final Widget child;
  final int delay;
  final AnimationController controller;
  ShowLeft({@required this.child, this.delay, this.controller});

  @override
  _ShowLeftState createState() => _ShowLeftState();
}

class _ShowLeftState extends State<ShowLeft> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = this.widget.controller == null
        ? AnimationController(
            vsync: this, duration: Duration(milliseconds: 800))
        : this.widget.controller;
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.50, 0.0), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (this.widget.controller == null) _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
