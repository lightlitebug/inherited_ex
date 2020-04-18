import 'package:flutter/material.dart';
import 'package:inherited_ex/counter_stateful_widget.dart';

class CounterInherited extends InheritedWidget {
  final CounterStatefulWidgetState counter;

  CounterInherited({
    Key key,
    @required Widget child,
    this.counter,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
