import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/input_3_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/input_3_web.dart';

class Input3 extends StatefulWidget {
  final double vakit;
  final double sigara;
  const Input3({Key? key, required this.vakit, required this.sigara})
      : super(key: key);

  @override
  State<Input3> createState() => _Input3State();
}

class _Input3State extends State<Input3> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720
        ? Input3Mobile(
            vakit: widget.vakit,
            sigara: widget.sigara,
          )
        : Input3Web(
            vakit: widget.vakit,
            sigara: widget.sigara,
          );
  }
}
