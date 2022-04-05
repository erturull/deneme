import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasam_verileri/screens/home.dart';
import 'package:yasam_verileri/screens/index.dart';
import 'package:yasam_verileri/screens/input_1.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/screens/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yaşam Verileri',
      defaultTransition: Transition.rightToLeftWithFade,
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 300),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const Index(),
        ),
        GetPage(
          name: '/home',
          page: () => const Home(),
        ),
        GetPage(
          name: '/input1',
          page: () => const Input1(),
        ),
      ],
      home: const SplashScreen(),
    );
  }
}
