import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_checkdoc/domain/entities/register_request.dart';
import 'package:flutter_checkdoc/domain/entities/register_response.dart';
import 'package:flutter_checkdoc/domain/use_cases/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;
  RegisterBloc({required this.registerUser}) : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) {
      emit(RegisterLoading());
      // Perform the registration logic here
      // Replace the code below with your actual registration logic
      RegisterRequest registerRequest = RegisterRequest(
        email: event.email,
        password: event.password,
        isActive: true,
        isSuperuser: false,
        isVerified: true,
      );
      registerUser(RegisterUserParams(registerRequest: registerRequest))
          .then((response) {
        response.fold(
          (failure) => emit(RegisterFailure(failure.toString())),
          (response) => emit(RegisterSuccess(response)),
        );
      });
    });
  }
}
