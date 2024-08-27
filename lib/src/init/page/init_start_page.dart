import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitStartPage extends StatelessWidget {
  const InitStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 99,
              height: 116,
              child: Image.asset(
                  'assets/images/VULTURES2-08032024ZV2.webp',
              ),
            ),
            const SizedBox(height: 40),
            Text(
              '칸예웨스트 굿즈 공식 샵',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '전국 3일내 배송, \n 지금 내 동네를 선택하고 시작해보세요',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                color: Colors.white.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
