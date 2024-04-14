import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{
  final String token;
  final String refreshToken;

  const LoginResponse({required this.token, required this.refreshToken});
  
  @override
  // TODO: implement props
  List<Object?> get props => [token, refreshToken];

 
}