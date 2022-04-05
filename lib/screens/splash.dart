import 'package:flutter/material.dart';
import 'package:yasam_verileri/screens/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashTime() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Index()),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      splashTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Hero(
        tag: 'splash-logo',
        child: Image.asset('images/logo.png'),
      ),
    ));
  }
}
