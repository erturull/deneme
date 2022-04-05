import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_finish.dart';

class Input5Mobile extends StatefulWidget {
  final double vakit;
  final double sigara;
  final double kilo;
  final double boy;
  final bool sosyal;
  const Input5Mobile({
    Key? key,
    required this.vakit,
    required this.sigara,
    required this.kilo,
    required this.boy,
    required this.sosyal,
  }) : super(key: key);

  @override
  State<Input5Mobile> createState() => _Input5MobileState();
}

class _Input5MobileState extends State<Input5Mobile> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MyDesigns().assetImageBackground(path: 'images/sport.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextMethods().headText(
                  text: 'Haftanın kaç günü spor yapıyorsun?',
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              SfSlider(
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 0,
                value: value.toInt(),
                interval: 1,
                onChanged: (e) {
                  setState(() {
                    value = e;
                  });
                },
                min: 0,
                max: 7,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextMethods().inputBackButton(onTap: () {
                      Navigator.pop(context);
                    }),
                    const Spacer(),
                    TextMethods().inputNextButton(onTap: () {
                      Get.to(
                        () => InputFinish(
                          vakit: widget.vakit,
                          sosyal: widget.sosyal,
                          sigara: widget.sigara,
                          spor: value,
                          kilo: widget.kilo,
                          boy: widget.boy,
                        ),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
