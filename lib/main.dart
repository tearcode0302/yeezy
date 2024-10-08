import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeezy/src/common/controller/authentication_controller.dart';
import 'package:yeezy/src/common/controller/data_load_controller.dart';
import 'package:yeezy/src/home/page/home_page.dart';
import 'package:yeezy/src/splash/controller/splash_controller.dart';
import 'package:yeezy/src/user/controller/login_controller.dart';
import 'package:yeezy/src/user/login/page/login_page.dart';
import 'package:yeezy/src/user/repository/authentication_repository.dart';
import 'package:yeezy/src/user/repository/user_repository.dart';
import 'package:yeezy/src/user/signup/controller/signup_controller.dart';
import 'package:yeezy/src/user/signup/page/signup_page.dart';

import 'firebase_options.dart';
import 'src/app.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return GetMaterialApp(
      title: 'Yeezy.com 구축하기',
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color(0xff212123),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xff212123),
      ),
      initialBinding: BindingsBuilder(() {
        var authenticationRepository =
            AuthenticationRepository(FirebaseAuth.instance);
        var user_repository = UserRepository(db);
        Get.put(authenticationRepository);
        Get.put(user_repository);
        Get.put(SplashController());
        Get.put(DataLoadController());
        Get.put(AuthenticationController(
            authenticationRepository, user_repository));
      }),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            binding: BindingsBuilder(() {
              Get.lazyPut<LoginController>(
                  () => LoginController(Get.find<AuthenticationRepository>()));
            })),
        GetPage(
          name: '/signup/:uid',
          page: () => const SignupPage(),
          binding: BindingsBuilder(() {
            Get.create<SignupController>(
                () => SignupController(Get.find<UserRepository>(), Get.parameters['uid'] as String)
            );
          }),
        ),
      ],
    );
  }
}
