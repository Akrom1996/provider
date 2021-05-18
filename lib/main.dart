import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider1/counter.dart';
import 'package:provider/provider.dart';
import 'package:provider1/second.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Counter()),
    ChangeNotifierProvider(create: (context) => User()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    final counter = Provider.of<Counter>(context, listen: false);
    print("building");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${Provider.of<Counter>(context).counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                '${Provider.of<User>(context).users}',
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Second()));
                },
                child: Text("secondPage"),
              ),
              ElevatedButton(
                  onPressed: () {
                    counter.decrementCounter();
                    user.removeLast();
                  },
                  child: Icon(Icons.remove))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // u.setAge = Random(30);
          // u.setName = "Akrom";
          counter.incrementCounter();
          Random random = Random();
          user.setAge = random.nextInt(20);
          user.setName = "Akrom";
          user.setUsers();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
