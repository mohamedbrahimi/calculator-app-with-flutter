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
  var _defaultCurrency = 'Dinares';
  final _minimumPadding = 5.0;
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
                        child: Text('Calculate'),
                        onPressed: () => {

                        }),
                  ),
                  Container(width: _minimumPadding * 5,),
                  Expanded(
                    child: RaisedButton(
                        child: Text('Reset'),
                        onPressed: () => {
                          
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 10),
              child: Text('Todo Text'),
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