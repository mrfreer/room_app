import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  final TextEditingController _lengthController = new TextEditingController();
  final TextEditingController _widthController = new TextEditingController();
  String _finalResult = "";

  void setRoom(){
    double length = double.parse(_lengthController.text.toString());
    double width = double.parse(_widthController.text.toString());
    setState(() {
      double area = length * width;
      double sqm = area * .0929;
      _finalResult = "The area is " + area.toStringAsFixed(2) + " sq ft \n " +
      sqm.toStringAsFixed(2) + " sq meters";
    });
  }
  @override
    Widget build(BuildContext context) {
      TextField textFieldL = new TextField(
        controller: _lengthController,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          helperText: "Enter length of the room in ft.",
        ),
      );
      TextField textFieldW = new TextField(
        controller: _widthController,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          helperText: "Enter width of the room in ft.",
        ),
      );

      RaisedButton raisedButton = new RaisedButton(
          child: new Text("Calculate"),
          onPressed: setRoom);
      Container container = new Container(
        child: new Column(
          children: <Widget>[
            textFieldL, textFieldW, raisedButton, new Text("$_finalResult"),
          ],
        ),
      );

      AppBar appBar = new AppBar(
        title: new Text("Enter length of room"),);
      Scaffold scaffold = new Scaffold(appBar: appBar, body: container,);
      return scaffold;
    }
}