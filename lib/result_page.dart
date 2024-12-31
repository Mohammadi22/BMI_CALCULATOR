import 'package:bmicalculator/buttomButton.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/reuable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

    ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Results Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTextTilteStyle,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                child: ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(resultText!.toUpperCase(), style: kResultsTextStyle),
                      Text(bmiResult!, style: kBMIStyle),
                      Column(
                        children: [
                          Text("Normal BMI Range", style: kGrayBMIStyle),
                          Text('18.5 - 25g/m2', style: kBodyBMIStyle),
                          SizedBox(height: 35),
                          Text(
                            interpretation!,
                            style: kBodyBMIStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      ButtonButtom(
                          tile: ("Re_CalCulator"),
                          onTop: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
