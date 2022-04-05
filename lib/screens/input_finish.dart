import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/input_finish_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/input_finish_web.dart';

class InputFinish extends StatefulWidget {
  final double sigara;
  final double vakit;
  final double spor;
  final double boy;
  final double kilo;
  final bool sosyal;
  const InputFinish({
    Key? key,
    required this.sigara,
    required this.vakit,
    required this.spor,
    required this.boy,
    required this.kilo,
    required this.sosyal,
  }) : super(key: key);

  @override
  State<InputFinish> createState() => _InputFinishState();
}

class _InputFinishState extends State<InputFinish> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720
        ? InputFinishMobile(
            vakit: widget.vakit,
            sigara: widget.sigara,
            kilo: widget.kilo,
            boy: widget.boy,
            social: widget.sosyal,
            spor: widget.spor,
          )
        : InputFinishWeb(
            vakit: widget.vakit,
            sigara: widget.sigara,
            kilo: widget.kilo,
            boy: widget.boy,
            social: widget.sosyal,
            spor: widget.spor,
          );
  }
}
