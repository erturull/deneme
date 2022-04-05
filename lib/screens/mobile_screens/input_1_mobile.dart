import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_2.dart';

class Input1Mobile extends StatefulWidget {
  const Input1Mobile({Key? key}) : super(key: key);

  @override
  State<Input1Mobile> createState() => _Input1MobileState();
}

class _Input1MobileState extends State<Input1Mobile> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MyDesigns().assetImageBackground(path: 'images/yoga.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextMethods().headText(
                  text: 'Haftanın kaç günü kendine vakit ayırıyorsun?',
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
                        () => Input2(vakit: value),
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
