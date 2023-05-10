import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weapon/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  late SplashController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Pablo Weapon App.png"),
            const Text('The Ultimate Weapons Shop')
          ],
        ),
      ),
    );
  }
}
