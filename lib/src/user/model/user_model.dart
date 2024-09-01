import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? uid;
  final String? name;
  final String? email;

  const UserModel({
    this.uid,
    this.name,
    this.email,
  });

  @override
  List<Object?> get props => [
    uid,
    name,
    email,
  ];
}
