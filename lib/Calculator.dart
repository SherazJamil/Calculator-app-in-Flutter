import 'package:flutter/material.dart';
import 'const.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Widget switchBtn() {
  //   return NewContainer();
  // }

  Widget _btnRound({
    required String title,
    double padding = 17,
    IconData? icon,
    Color? icnColor,
    Color? txtColor
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NewContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                '$title',
                style: TextStyle(
                    color: txtColor ?? (darkMode ? Colors.white : Colors.black),
                    fontSize: 30
                ),
              )
                  : Icon(
                icon,
                color: icnColor,
                size: 30,
              )),
        ),
      ),
    );
  }

  Widget _btnOval({
    required String title,
    double padding = 17
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: NewContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(50),
        padding:
        EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: Container(
          width: padding * 2,
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
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
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _btnOval(title: 'C'),
                        _btnOval(title: 'DEL'),
                        _btnOval(title: '%'),
                        _btnOval(title: '/')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _btnRound(title: '7'),
                        _btnRound(title: '8'),
                        _btnRound(title: '9'),
                        _btnRound(
                            title: 'x',
                            txtColor: darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _btnRound(title: '4'),
                        _btnRound(title: '5'),
                        _btnRound(title: '6'),
                        _btnRound(
                            title: '-',
                            txtColor: darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _btnRound(title: '1'),
                        _btnRound(title: '2'),
                        _btnRound(title: '3'),
                        _btnRound(
                          title: '+',
                          txtColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                          onPressed: (){},
                          shape: const StadiumBorder(),
                          color: Colors.grey[850],
                          child:  Text(
                            '0',
                            style: TextStyle(
                                fontSize: 35,
                              color: darkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        _btnRound(title: '.', txtColor: darkMode ? Colors.green : Colors.redAccent),
                        _btnRound(title: '=', txtColor: darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                  ],
          ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const NewContainer({
    Key? key,
    this.darkMode = false,
    required this.child,
    required this.borderRadius,
    required this.padding,
  }) : super(key: key);

  @override
  State<NewContainer> createState() => _NewContainerState();
}

class _NewContainerState extends State<NewContainer> {
  bool _isPress = false;

  void _onUp(PointerUpEvent event) {
    setState(() {
      _isPress = false;
    });
  }

  void _onDown(PointerDownEvent event) {
    setState(() {
      _isPress = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerUp: _onUp,
      onPointerDown: _onDown,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPress
                ? null
                : [
                    BoxShadow(
                      color:
                          darkMode ? Colors.black54 : Colors.blueGrey.shade300,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                        color:
                            darkMode ? Colors.blueGrey.shade700 : Colors.white,
                        offset: const Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1),
                  ]),
        child: widget.child,
      ),
    );
  }
}
