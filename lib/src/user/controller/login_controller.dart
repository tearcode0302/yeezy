import 'package:get/get.dart';
import 'package:yeezy/src/user/repository/authentication_repository.dart';

class LoginController extends GetxController {
  final AuthenticationRepository authenticationRepository;
  LoginController(this.authenticationRepository);

  void googleLogin() async {
    await authenticationRepository.signInWithGoogle();
  }

  void appleLogin() async {
    await authenticationRepository.signInWithApple();
  }
}