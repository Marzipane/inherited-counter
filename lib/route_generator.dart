import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';

class RouteGenerator extends StatefulWidget {
  const RouteGenerator({Key? key}) : super(key: key);

  @override
  RouteGeneratorState createState() => RouteGeneratorState();
}

class RouteGeneratorState extends State<RouteGenerator> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 0) {
        counter = 0;
      } else {
        counter--;
      }
    });
  }

  void doubleCounter() {
    setState(() {
      counter *= 2;
    });
  }

  int get counterValue {
    if (counter >= 50) {
      counter = 50;
      return counter;
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
        counter: counter,
        myState: this,
        child: Navigator(
          onGenerateRoute: ((settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(
                  builder: (context) => const ChildWidget());
            } else if (settings.name == Counter.routeName) {
              return MaterialPageRoute(builder: (context) => const Counter());
            }
          }),
        ));
  }
}
