import 'package:flutter/material.dart';
import 'package:inherited_ex/counter_stateful_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CounterStatefulWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inherited Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ShowCounter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IncrementButton(),
                  DecrementButton(),
                ],
              ),
              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterInherited = CounterStatefulWidget.of(context);
    print('Rebuild - ShowCounter');

    return Center(
      child: Text(
        counterInherited.counter.toString(),
        style: TextStyle(fontSize: 128.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterInherited = CounterStatefulWidget.of(context, listen: false);
    print('Rebuild - IncrementButton');

    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(
        'Increment',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: counterInherited.incrementCounter,
    );
  }
}

class DecrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterInherited = CounterStatefulWidget.of(context, listen: false);
    print('Rebuild - DecrementButton');

    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(
        'Decrement',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: counterInherited.decrementCounter,
    );
  }
}
