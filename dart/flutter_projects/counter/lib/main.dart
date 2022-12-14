import 'package:counter/count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => CounterProvider()))
    ],
    child: MaterialApp(home: App()),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.lightBlue),
              alignment: Alignment.center,
              child: Text(
                "${counterProvider.count}",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: InkWell(
              onTap: () => counterProvider.increment(),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "+",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () => counterProvider.decrement(),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "-",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
