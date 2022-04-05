import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/methods/text_methods.dart';

class SettingsPageMobile extends StatefulWidget {
  const SettingsPageMobile({Key? key}) : super(key: key);

  @override
  State<SettingsPageMobile> createState() => _SettingsPageMobileState();
}

class _SettingsPageMobileState extends State<SettingsPageMobile> {
  var data = GetStorage();
  int? vakit;
  int? sigara;
  int? boy;
  int? kilo;
  bool? sosyal;
  String? isim;
  int? spor;

  void deleteAllData() {
    data.remove('vakit');
    data.remove('sigara');
    data.remove('boy');
    data.remove('kilo');
    data.remove('sosyal');
    data.remove('control');
    data.remove('isim');
    data.remove('spor');
    Get.offNamedUntil('/', (route) => false);
  }

  InputDecoration myInputDecoration(
      {required String label, required String hint}) {
    return InputDecoration(
      label: const Text('Boy'),
      hintText: 'Boy',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: TextMethods().headText(text: 'Ayarlar'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                deleteAllData();
              },
              child: TextMethods().standartText(text: 'Uygulamayı Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }
}
