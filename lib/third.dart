import 'package:flutter/material.dart';
import 'package:provider1/counter.dart';
import 'package:provider/provider.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "${Provider.of<Counter>(context).counter}",
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Counter>(context, listen: false)
                      .decrementCounter();
                },
                child: Icon(Icons.remove))
          ],
        ),
      ),
    );
  }
}
