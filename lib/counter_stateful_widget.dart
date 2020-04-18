import 'package:flutter/material.dart';
import 'package:inherited_ex/counter_inherited.dart';

class CounterStatefulWidget extends StatefulWidget {
  final Widget child;

  CounterStatefulWidget({this.child});

  @override
  CounterStatefulWidgetState createState() => CounterStatefulWidgetState();

  static CounterStatefulWidgetState of(
    BuildContext context, {
    bool listen = true,
  }) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<CounterInherited>().counter
        : context.findAncestorWidgetOfExactType<CounterInherited>().counter;
  }
}

class CounterStatefulWidgetState extends State<CounterStatefulWidget> {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInherited(
      counter: this,
      child: widget.child,
    );
  }
}
