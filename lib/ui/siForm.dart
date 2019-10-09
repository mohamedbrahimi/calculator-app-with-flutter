import 'package:flutter/material.dart';

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Dinares', 'Dollares', 'Euros', 'Others'];
  var _defaultCurrency = '';
  final _minimumPadding = 5.0;

  @override
  void initState() {
    super.initState();
    _defaultCurrency = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController ratioController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var _displayResult = '...';
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Xamaira math'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 5),
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                controller: principalController,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Principal e.g 12000',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                controller: ratioController,
                decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'In percent',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child:  Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: termController,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Time in years',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                    ),
                  ),
                  Container(width: _minimumPadding * 5,),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }
                      ).toList(),
                      value: _defaultCurrency,
                      onChanged: (String newValueSelected){
                        setState((){
                          _defaultCurrency = newValueSelected;
                          _displayResult = _calculateTotalReturns();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text('Calculate', textScaleFactor: 1.5,),
                        onPressed: () {
                          setState(() {
                            _displayResult = _calculateTotalReturns();
                          });
                        }),
                  ),
                  Container(width: _minimumPadding * 5,),
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Reset', textScaleFactor: 1.5,),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 10),
              child: Text('Todo Text', style: textStyle,),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(image: assetImage, width: 200.0, height: 150.0,);
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
}