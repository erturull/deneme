import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/input_4_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/input_4_web.dart';

class Input4 extends StatefulWidget {
  final double sigara;
  final double vakit;
  final double height;
  final double weight;
  const Input4(
      {Key? key,
      required this.sigara,
      required this.vakit,
      required this.height,
      required this.weight})
      : super(key: key);

  @override
  State<Input4> createState() => _Input4State();
}

class _Input4State extends State<Input4> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720
        ? Input4Mobile(
            vakit: widget.vakit,
            sigara: widget.sigara,
            kilo: widget.weight,
            boy: widget.height,
          )
        : Input4Web(
            vakit: widget.vakit,
            sigara: widget.sigara,
            height: widget.weight,
            weight: widget.height,
          );
  }
}
