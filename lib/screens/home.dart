import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _bmiResult = 0;
  String _bmiResultText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8))),
                  ),
                ),
                Container(
                  width: 140,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weigth",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _bmiResultText = "You're over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _bmiResultText = "You have normal weight";
                  }
                });
              },
              child: Text('Calculate',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _bmiResultText.isNotEmpty,
                child: Text(_bmiResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                _bmiResultText,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor),
              ),
            ),
            const SizedBox(height: 10),
            const LeftBar(
              barWidth: 30,
            ),
            const SizedBox(height: 20),
            const LeftBar(
              barWidth: 70,
            ),
            const SizedBox(height: 20),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(height: 10),
            const Rightbar(
              barWidth: 70,
            ),
            const SizedBox(height: 50),
            const Rightbar(
              barWidth: 40,
            ),
          ],
        ),
      ),
    );
  }
}
