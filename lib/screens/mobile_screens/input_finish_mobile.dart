import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';

class InputFinishMobile extends StatefulWidget {
  final double vakit;
  final double sigara;
  final double kilo;
  final double boy;
  final bool social;
  final double spor;
  const InputFinishMobile({
    Key? key,
    required this.vakit,
    required this.sigara,
    required this.kilo,
    required this.boy,
    required this.social,
    required this.spor,
  }) : super(key: key);

  @override
  State<InputFinishMobile> createState() => _InputFinishMobileState();
}

class _InputFinishMobileState extends State<InputFinishMobile> {
  final data = GetStorage();
  bool control = false;

  void pageAnimation() async {
    setState(() {
      control = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
    setState(() {
      control = false;
    });
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.offNamedUntil('/home', (route) => false);
  }

  @override
  void initState() {
    super.initState();
    saveData();
    Future.delayed(Duration.zero, () {
      pageAnimation();
    });
  }

  void saveData() {
    data.write('vakit', widget.vakit);
    data.write('sigara', widget.sigara);
    data.write('kilo', widget.kilo);
    data.write('boy', widget.boy);
    data.write('sosyal', widget.social);
    data.write('control', true);
    data.write('spor', widget.spor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: control == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Stack(children: [
                  AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 1),
                    top: control == false ? -1000 : 0,
                    right: 0,
                    left: 0,
                    child: MyDesigns().assetImageBackground(
                        path: 'images/finish.png', finish: true),
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 1),
                    bottom: control == false ? -1000 : 50,
                    right: 0,
                    left: 0,
                    child: TextMethods().headText(
                        text: 'Tebrikler! \n Bütün verileri doldurdun',
                        fontSize: 42,
                        textAlign: TextAlign.center),
                  ),
                ]),
              ),
      ),
    );
  }
}
