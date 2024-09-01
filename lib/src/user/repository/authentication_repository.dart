import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository(this._firebaseAuth);

  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map<UserModel?>((user) {
      return user == null ? null : UserModel(
        name: user.displayName,
        uid: user.uid,
        email: user.email,
      );
    });
  }
}