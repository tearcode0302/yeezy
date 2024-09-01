import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezy/src/common/controller/authentication_controller.dart';

import '../../common/components/app_font.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.find<AuthenticationController>().logout();
          },
          child: const AppFont('홈'),
        ),
      ),
    );
  }
}
