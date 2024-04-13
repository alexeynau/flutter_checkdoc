import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable{
  final String grantType;
  final String username;
  final String password;
  final String scope;
  final String clientId;
  final String clientSecret;

  LoginRequest({
    this.grantType = '',
    required this.username,
    required this.password,
    this.scope = '',
    this.clientId = '',
    this.clientSecret = '',
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [grantType, username, password, scope, clientId, clientSecret];
}