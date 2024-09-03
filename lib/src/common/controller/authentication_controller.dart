import 'package:get/get.dart';
import 'package:yeezy/src/common/enum/authentication_status.dart';
import 'package:yeezy/src/user/repository/authentication_repository.dart';

import '../../user/model/user_model.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;
  Rx<AuthenticationStatus> status = AuthenticationStatus.init.obs;
  Rx<UserModel> userModel = const UserModel().obs;

  void authCheck() async {
    _authenticationRepository.user.listen((user) {
      _userStateChangedEvent(user);
    });
  }

  void _userStateChangedEvent(UserModel? user) async {
    if (user == null) {
      status(AuthenticationStatus.unknown);
    } else {

    }
  }

  void logout() async {
    await _authenticationRepository.logout();
  }
}