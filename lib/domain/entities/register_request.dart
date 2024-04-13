

import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable{
  final String id;
  final String email;
  final bool isActive;
  final bool isSuperuser;
  final bool isVerified;
  final int balance;

  RegisterRequest({
    required this.id,
    required this.email,
    required this.isActive,
    required this.isSuperuser,
    required this.isVerified,
    required this.balance,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, email, isActive, isSuperuser, isVerified, balance];

}