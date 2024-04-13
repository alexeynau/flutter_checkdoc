import 'package:equatable/equatable.dart';

class UserDocument extends Equatable {
  final String name;
  final String content;

  const UserDocument({
    required this.name,
    required this.content,
  });

  @override
  List<Object?> get props => [
        name,
        content,
      ];
}