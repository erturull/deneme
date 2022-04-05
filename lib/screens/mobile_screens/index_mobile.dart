import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';

class IndexMobile extends StatefulWidget {
  const IndexMobile({Key? key}) : super(key: key);

  @override
  State<IndexMobile> createState() => _IndexMobileState();
}

class _IndexMobileState extends State<IndexMobile> {
  final TextEditingController _nameController = TextEditingController();
  final data = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Hero(
              tag: 'splash-logo',
              child: MyDesigns().assetImageBackground(path: 'images/logo.png')),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3,
                vertical: 10),
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
          TextMethods().headText(
              text:
                  'Merhaba! ${(_nameController.text.toLowerCase()).capitalize}'),
          TextMethods().standartText(
            textAlign: TextAlign.center,
            text:
                "Yaşam Verileri'ne hoş geldin! Uygulamamızın nihayi amacı sizlere verilerinize bağlı olarak tavsiyeler vermektir!",
          ),
          const Spacer(),
          TextMethods().inputNextButton(onTap: () {
            if (_nameController.text.isNotEmpty) {
              data.write(
                  'isim', (_nameController.text.toLowerCase()).capitalize);
              Get.toNamed('/input1');
            } else {
              Get.snackbar(
                  'Bilgilendirme', 'Devam etmek için adınızı girmelisiniz');
            }
          }),
          const Spacer(),
        ],
      ),
    );
  }
}
