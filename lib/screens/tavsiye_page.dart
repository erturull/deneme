import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/mobile_screens/tavsiye_mobile.dart';

class TavsiyePage extends StatefulWidget {
  final String konu;
  final String durum;
  final String imagePath;
  const TavsiyePage(
      {Key? key,
      required this.konu,
      required this.durum,
      required this.imagePath})
      : super(key: key);

  @override
  State<TavsiyePage> createState() => _TavsiyePageState();
}

class _TavsiyePageState extends State<TavsiyePage> {
  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720
        ? TavsiyeMobile(
            konu: widget.konu,
            durum: widget.durum,
            imagePath: widget.imagePath,
          )
        : const Text('');
  }
}
