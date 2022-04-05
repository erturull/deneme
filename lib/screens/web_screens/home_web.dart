import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  final data = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${data.read('isim')} | ${data.read('kilo')}"),
      ),
    );
  }
}
