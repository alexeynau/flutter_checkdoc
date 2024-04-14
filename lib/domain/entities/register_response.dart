import 'package:equatable/equatable.dart';


class RegisterResponse extends Equatable {
  final String id;
  final String email;
  final bool isActive;
  final bool isSuperuser;
  final bool isVerified;
  final int balance;

  const RegisterResponse({
    required this.id,
    required this.email,
    required this.isActive,
    required this.isSuperuser,
    required this.isVerified,
    required this.balance,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        isActive,
        isSuperuser,
        isVerified,
        balance,
      ];
}