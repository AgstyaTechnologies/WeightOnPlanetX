import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight On Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            Image.asset('images/planet.png', width: 200.0, height: 133.0),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Your Weigth On Earth',
                      hintText: 'In Pounds',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          value: 0,
                          activeColor: Colors.brown,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Pluto",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          value: 1,
                          activeColor: Colors.red,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Mars",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          value: 2,
                          activeColor: Colors.orangeAccent,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : "$_formattedText lbs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return (int.parse(weight) * multiplier);
    } else {
      return (int.parse(weight) * 0.38);
    }
  }
}
