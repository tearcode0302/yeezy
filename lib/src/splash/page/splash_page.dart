import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezy/src/splash/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
            () => Text(
              '${controller.loadStep.value.name}중 입니다.',
              style: const TextStyle(color: Colors.white),
            )
        )
      ),
    );
  }
}
