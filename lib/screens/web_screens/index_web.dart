import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';

class IndexWeb extends StatefulWidget {
  const IndexWeb({Key? key}) : super(key: key);

  @override
  State<IndexWeb> createState() => _IndexWebState();
}

class _IndexWebState extends State<IndexWeb> {
  final data = GetStorage();
  final TextEditingController _nameController = TextEditingController();
  bool control = false;

  void dataControl() {
    if (data.read('control') != null) {
      if (data.read('control') == true) {
        Get.offNamedUntil('/homeMobile', (route) => false);
      }
    } else {
      setState(() {
        control = true;
      });
    }
    if (data.read('isim') != null) {
      data.remove('isim');
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
    return control == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'fLogo',
                      child: MyDesigns().assetImageBackground(
                          path: 'images/logo.png', web: true),
                    ),
                    Column(
                      children: [
                        TextMethods().headText(
                            text:
                                'Merhaba! ${(_nameController.text.toLowerCase()).capitalize}'),
                        TextMethods().standartText(
                          textAlign: TextAlign.center,
                          text:
                              "Yaşam Verileri'ne hoş geldin! \nUygulamamızın bir kısmı bilgilerinize göre analiz yaparak size tavsiyeler vermek üzerineyken; \ndiğer kısımı yaptıklarınız üzerinden ortalamaları size sunmaktadır!",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: SizedBox(
                            width: 150,
                            child: TextField(
                              onChanged: (e) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                label: const Text('Adınız'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              controller: _nameController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextMethods().inputNextButton(onTap: () {
                          if (_nameController.text.isEmpty) {
                            Get.snackbar(
                              'Bilgilendirme',
                              'Devam etmek için adınızı girmelisiniz',
                            );
                          } else {
                            data.write('isim',
                                _nameController.text.toLowerCase().capitalize);
                            Get.toNamed('/input1');
                          }
                        }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
