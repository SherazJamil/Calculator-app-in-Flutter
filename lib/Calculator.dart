import 'package:flutter/material.dart';
import 'Neumorphism.dart';
import 'const.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  int n1 = 0;
  int n2 = 0;
  String output = "0";
  String op = "0";
  String oprnd = "";

  void btnClick(String btnVal) {

    if(btnVal == "C") {
      op = "0";
      n1 = 0;
      n2 = 0;
      oprnd = "";
    }
    else if(btnVal == "+" || btnVal == "-" || btnVal =="x" || btnVal == "/" || btnVal == "%") {
      n1 = int.parse(output);
      oprnd = btnVal;
     op = "0";
      output = output + btnVal;
    }
    else if(btnVal == "=") {
      n2 = int.parse(output);
      if(oprnd == "+") {
        op = (n1 + n2).toString();
      }
      if(oprnd == "-") {
        op = (n1 - n2).toString();
      }
      if(oprnd == "x") {
        op = (n2 * n1).toString();
      }
      if(oprnd == "/") {
        op = (n1 / n2).toString();
      }
      if(oprnd =="%") {
        op = (n1 / 100).toString();
      }
      n1 = 0;
      n2 = 0;
      //_out = "0";
    }
    else if(btnVal =="DE") {
      op = output.substring(0, output.length - 1);
    }
    else {
      op =  int.parse(output + btnVal).toString();
    }

    setState(() {
      output = op;
    });
  }

  Widget switchBtn() {
    return Neumorph(
      darkMode: darkMode,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.wb_sunny_outlined,
            color: darkMode ? Colors.grey : Colors.redAccent,
          ),
          Icon(
            Icons.nightlight_rounded,
            color: darkMode ? Colors.green : Colors.grey,
          ),
        ]),
      ),
    );
  }

  Widget roundBtn(
      {required String title,
      double padding = 17,
      IconData? icon,
      Color? icnColor,
      Color? txtColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => btnClick(title),
        child: Neumorph(
          darkMode: darkMode,
          borderRadius: BorderRadius.circular(40),
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
                child: title != null
                    ? Text(
                        title,
                        style: TextStyle(
                            color: txtColor ??
                                (darkMode ? Colors.white : Colors.black),
                            fontSize: 30),
                      )
                    : Icon(
                        icon,
                        color: icnColor,
                        size: 30,
                      )),
          ),
        ),
      ),
    );
  }

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode ? darkMode = false : darkMode = true;
                        });
                      },
                      child: switchBtn()),
                  const SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      output,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      roundBtn(title: 'C'),
                      roundBtn(title: 'DE'),
                      roundBtn(title: '%'),
                      roundBtn(
                          title: '/',
                          txtColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      roundBtn(title: '7'),
                      roundBtn(title: '8'),
                      roundBtn(title: '9'),
                      roundBtn(
                          title: 'x',
                          txtColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      roundBtn(title: '4'),
                      roundBtn(title: '5'),
                      roundBtn(title: '6'),
                      roundBtn(
                          title: '-',
                          txtColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      roundBtn(title: '1'),
                      roundBtn(title: '2'),
                      roundBtn(title: '3'),
                      roundBtn(
                        title: '+',
                        txtColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      roundBtn(
                        title: '0',
                      ),
                      roundBtn(
                          title: '00',
                          txtColor: darkMode ? Colors.green : Colors.redAccent),
                      roundBtn(
                          title: '=',
                          txtColor: darkMode ? Colors.green : Colors.redAccent),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}