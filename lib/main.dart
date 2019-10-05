import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Stateful App Test ..",
      home: FavoriteCity(),
    )
  );
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameCity = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull App Test ..."),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "The next city is $nameCity",
                style: TextStyle(fontSize: 20.0),
              ),
            )
           
        ]
      ),
    )
   );
  }

}