import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybmicalculator/components/bottom_button.dart';
import 'package:mybmicalculator/components/reusable_card.dart';
import 'package:mybmicalculator/constants.dart';
import 'package:mybmicalculator/screens/welcomePage.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText});

  final String bmiResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Save',
            onTap: () {
              final _firestore = Firestore.instance;
              _firestore.collection('history').add({
                'userEmail': email,
                'bmi': bmiResult,
                'date': DateTime.now().year.toString() + (DateTime.now().month.toString().length == 2? DateTime.now().month.toString(): '0' + DateTime.now().month.toString()) + (DateTime.now().day.toString().length == 2? DateTime.now().day.toString(): '0' + DateTime.now().day.toString()),
              });

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text('BMI saved'),
                        content: FlatButton(
                          child: Text(
                              'Ok', textScaleFactor: 1.1,
                              style: TextStyle(
                                color: Color(0xFFFFA4FF),
                              )
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                    );
                  }
              );
            },
          )
        ],
      ),
    );
  }
}
