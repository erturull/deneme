import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/input_5_spor.dart';

class Input5 extends StatefulWidget {
  final double sigara;
  final double vakit;
  final double height;
  final double weight;
  final bool sosyal;
  const Input5(
      {Key? key,
      required this.sigara,
      required this.vakit,
      required this.height,
      required this.weight,
      required this.sosyal})
      : super(key: key);

  @override
  State<Input5> createState() => _Input5State();
}

class _Input5State extends State<Input5> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720
        ? Input5Mobile(
            vakit: widget.vakit,
            sigara: widget.sigara,
            kilo: widget.weight,
            boy: widget.height,
            sosyal: widget.sosyal,
          )
        : Container();
  }
}
