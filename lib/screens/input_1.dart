import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/input_1_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/input_1_web.dart';

class Input1 extends StatefulWidget {
  const Input1({Key? key}) : super(key: key);

  @override
  State<Input1> createState() => _Input1State();
}

class _Input1State extends State<Input1> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;

    return _mainSize.width < 720 ? const Input1Mobile() : const Input1Web();
  }
}
