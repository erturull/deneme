import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/input_2_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/input_2_web.dart';

class Input2 extends StatefulWidget {
  final double vakit;
  const Input2({Key? key, required this.vakit}) : super(key: key);

  @override
  State<Input2> createState() => _Input2State();
}

class _Input2State extends State<Input2> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720
        ? Input2Mobile(vakit: widget.vakit)
        : Input2Web(
            vakit: widget.vakit,
          );
  }
}
