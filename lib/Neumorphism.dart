import 'package:flutter/material.dart';
import 'const.dart';

class Neumorph extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const Neumorph({
    Key? key,
    this.darkMode = false,
    required this.child,
    required this.borderRadius,
    required this.padding,
  }) : super(key: key);

  @override
  State<Neumorph> createState() => _NeumorphState();
}

class _NeumorphState extends State<Neumorph> {
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