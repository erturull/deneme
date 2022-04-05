import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/screens/mobile_screens/home_mobile.dart';
import 'package:yasam_verileri/screens/web_screens/home_web.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final data = GetStorage();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {});
  }

  @override
  Widget build(BuildContext context) {
    Size _mainSize = MediaQuery.of(context).size;
    return _mainSize.width < 720 ? const HomeMobile() : const HomeWeb();
  }
}
