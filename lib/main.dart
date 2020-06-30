import 'dart:async';
import 'dart:convert';
//import 'dart:html';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "cargo weight converter",
    home: CargoWeight(),
  ));
}

class CargoWeight extends StatefulWidget {
  @override
  _CargoWeightState createState() => _CargoWeightState();
}

class _CargoWeightState extends State<CargoWeight> {
  final fromController1 = TextEditingController();
  final fromController2 = TextEditingController();
  final fromController3 = TextEditingController();
  final fromController4 = TextEditingController();
  final fromController5 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fromController1.dispose();
    fromController2.dispose();
    fromController3.dispose();
    fromController4.dispose();
    fromController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: Center(child: Text('Cargo Weight Calculator')),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        child: Card(
          color: Colors.yellow.shade50,
          elevation: 3,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                title: TextField(
                  style: TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
                  //obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(20.0),
                        ),
                    labelText: 'Lenght',
                  ),
                  controller: fromController1,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                leading: Text('Length,m'),
                dense: true,
              ),
              ListTile(
                title: TextField(
                  style: TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Width',
                  ),
                  controller: fromController2,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                leading: Text('Width,m'),
              ),
              ListTile(
                title: TextField(
                  style: TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Height',
                  ),
                  controller: fromController3,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                leading: Text('Height,m'),
              ),
              ListTile(
                title: TextField(
                  style: TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Quantity',
                  ),
                  controller: fromController4,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                leading: Text('Quantity (pcs)'),
              ),
              ListTile(
                title: TextField(
                  style: TextStyle(
                    fontSize: 14,
                    height: 0.8,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gross Weight',
                  ),
                  controller: fromController5,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                leading: Text('Gross weight'),
              ),
              FlatButton(
                color: Colors.purpleAccent,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  String result = '';
                  String output = '';
                  double real_Weight = 0.0;
                  real_Weight = double.parse(fromController5.text);
                  result = ((double.parse(fromController1.text) *
                              double.parse(fromController2.text) *
                              double.parse(fromController3.text) *
                              double.parse(fromController4.text)) /
                          0.006)
                      .toStringAsFixed(2);

                  if (real_Weight > double.parse(result)) {
                    output = 'Gross Weight=' +
                        fromController5.text +
                        "kg \n" +
                        'volumetric weight=' +
                        result +
                        "kg \n" +
                        'you pay for:' +
                        fromController5.text;
                  } else {
                    output = 'Gross Weight is=' +
                        fromController5.text +
                        "kg \n" +
                        'volumetric weight=' +
                        result +
                        "kg \n" +
                        'you pay for:' +
                        result;
                  }
                  // clear all text fields for next entry
                  fromController1.clear();
                  fromController2.clear();
                  fromController3.clear();
                  fromController4.clear();
                  fromController5.clear();
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(output),
                      );
                    },
                  );
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
      //new code start
      // new code ended
    );
  }
}
