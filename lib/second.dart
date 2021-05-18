import 'package:flutter/material.dart';
import 'package:provider1/counter.dart';
import 'package:provider/provider.dart';
import 'package:provider1/third.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              '${Provider.of<Counter>(context).counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Third()));
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}
