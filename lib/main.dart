import 'package:bmicalculator/buttomButton.dart';
import 'package:bmicalculator/calculator.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/rawMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/reuable_card.dart';
import 'package:bmicalculator/iocn_content.dart';
import 'package:bmicalculator/result_page.dart';

enum Gender { male, female }

void main() {
  runApp(const MYApp());
}

class MYApp extends StatelessWidget {
  const MYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender? selectedGender;
  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI Calculator App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveColorsCard
                      : kInactiveColorsCard,
                  child: Center(
                    child: IconContent(
                      icon: (FontAwesomeIcons.mars),
                      label: "male",
                    ),
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveColorsCard
                      : kInactiveColorsCard,
                  child: Center(
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "female",
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height",
                  style: kLabelText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Center(
                      child: Text(
                        height.toString(),
                        style: kLabelStyle,
                      ),
                    ),
                    Text(
                      'cm',
                      style: kLabelText,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1fEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight", style: kLabelText),
                      Text(weight.toString(), style: kLabelStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RounRawMaterialButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RounRawMaterialButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("age", style: kLabelText),
                        Text(age.toString(), style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RounRawMaterialButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RounRawMaterialButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonButtom(
            tile: "CALCULATOR",
            onTop: () {
              Calculator calculator =
                  Calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calculator.calculateBMi(),
                            resultText: calculator.getResult(),
                            interpretation: calculator.getInterpretation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
