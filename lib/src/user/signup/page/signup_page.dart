import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezy/src/common/components/app_font.dart';
import 'package:yeezy/src/common/components/btn.dart';
import 'package:yeezy/src/user/signup/controller/signup_controller.dart';

class SignupPage extends GetWidget<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 99,
              height: 116,
              child: Image.asset('assets/images/VULTURES2-08032024ZV2.webp'),
            ),
            const SizedBox(
              height: 35,
            ),
            Obx(
              () => TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: '닉네임',
                    errorText: controller.isPossibleUseNickName.value ? null : '이미 존재하는 닉네임입니다.',
                    hintStyle: TextStyle(color: Color(0xff6D7179)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6D7179))),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6D7179)))),
                onChanged: controller.changeNickName,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20 + MediaQuery.of(context).padding.bottom),
        child: Btn(
          onTap: () async {
            if (!controller.isPossibleUseNickName.value) return;
            var result = await controller.signup();
            if (result != null) {
              Get.offNamed('/');
            }
          },
          padding: const EdgeInsets.symmetric(vertical: 17),
          color: controller.isPossibleUseNickName.value ? const Color(0xffED7738) : Colors.grey.withOpacity(0.9),
          child: const AppFont(
            '회원가입',
            align: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
