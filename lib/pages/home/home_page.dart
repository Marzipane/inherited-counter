// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../route_generator.dart';

class MyInheritedWidget extends InheritedWidget {
  final int counter;
  final RouteGeneratorState myState;

  const MyInheritedWidget(
      {Key? key,
      required this.counter,
      required Widget child,
      required this.myState})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return oldWidget.counter != oldWidget.myState.counterValue;
  }

  // Helper method to find the Inherited widget up the tree
  static MyInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Child Widget | Home Page'),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${rootWidgetState.counter}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      rootWidgetState.decrementCounter();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      rootWidgetState.incrementCounter();
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // children: const [Counter(), Counter()],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Counter.routeName);
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  static const routeName = '/counter';
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Counter Widget | Other Page'),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                rootWidgetState.decrementCounter();
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                rootWidgetState.incrementCounter();
              },
            ),
          ],
        )
      ]),
    );
  }
}

// TODO: IMPLEMENT THE ROUTE NAVIGATOR THAT IS WRAPPED WITH INHERITED WIDGET
// TODO: TRY TO CHANGE COUNTER VALUE ON ANOTHER PAGE
