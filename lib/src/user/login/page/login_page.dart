import 'package:flutter/material.dart';

import '../../../common/components/app_font.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget _logoView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 99,
          height: 116,
          child: Image.asset('assets/images/VULTURES2-08032024ZV2.webp'),
        ),
        const SizedBox(height: 40,),
        const AppFont(
          'Yezzy 제품을 여기서 !!',
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        const SizedBox(height: 15,),
        AppFont(
          'Yeezy 제품을 동네까지 배송해드려요, \n지금 내 동네를 선택하고 시작해보세요!',
          align: TextAlign.center,
          size: 18,
          color: Colors.white.withOpacity(0.6),
        ),
      ],
    );
  }

  Widget _textDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: AppFont(
              '회원가입/로그인',
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logoView(),
          _textDivider(),
        ],
      ),
    );
  }
}
