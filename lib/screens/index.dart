import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/screens/mobile_screens/index_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/index_web.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final data = GetStorage();
  final TextEditingController _nameController = TextEditingController();
  bool control = false;

  void dataControl() {
    print('çalışıyorum');
    if (data.read('control') != null) {
      if (data.read('control') == true) {
        Get.offNamedUntil('/home', (route) => false);
      }
    } else {
      setState(() {
        control = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      dataControl();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: control == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: _mainSize.width < 720
                  ? const IndexMobile()
                  : const IndexWeb(),
            ),
    );
  }
}
