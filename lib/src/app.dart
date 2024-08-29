import 'package:flutter/material.dart';
import 'package:yeezy/src/splash/page/splash_page.dart';

import '../main.dart';
import 'init/page/init_start_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool isInitStarted;

  @override
  void initState() {
    super.initState();
    isInitStarted = prefs.getBool('isInitStarted') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return isInitStarted ? InitStartPage(
      onStart: () {
        setState(() {
          isInitStarted = false;
        });
        prefs.setBool('isInitStarted', isInitStarted);
      }
    ) : const SplashPage();
  }
}
