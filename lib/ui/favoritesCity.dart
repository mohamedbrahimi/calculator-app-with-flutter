import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameCity = "";
  String _currentItemSelected = 'Dinares';
  var _currencies = ['Dinares', 'Dollars', 'Euros', 'Others'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Statefull App Test ..."),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
              children: <Widget>[
                TextField(
                  onSubmitted: (String userInput) {
                    setState(() {
                      nameCity = userInput;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: _currencies.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected){
                    _onDropDownItemSelected(newValueSelected);
                  },
                  value: _currentItemSelected,
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

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }

}