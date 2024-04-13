

import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable{
  final String email;
  final String password;
  final bool isActive;
  final bool isSuperuser;
  final bool isVerified;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.isActive,
    required this.isSuperuser,
    required this.isVerified,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [email, password, isActive, isSuperuser, isVerified];

}