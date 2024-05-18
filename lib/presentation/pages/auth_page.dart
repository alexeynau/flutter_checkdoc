import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_checkdoc/presentation/bloc/login_user_bloc/login_user_bloc.dart';

import '../../service_locator.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextStyle style =
      const TextStyle(fontSize: 18, color: Colors.grey, height: 2);
  @override
  Widget build(BuildContext context) {
    final loginUserBloc = BlocProvider.of<LoginUserBloc>(context);
    return Scaffold(
      body: BlocListener<LoginUserBloc, LoginUserState>(
        listener: (context, state) {
          if (state is LoginUserSuccess) {
            String accessToken = state.loginResponse.access_token;
            print("Access token in login page: $accessToken");
            getIt<GlobalVariables>().accessToken = accessToken;
            print(
                "Access token in global: ${getIt<GlobalVariables>().accessToken}");
            // Navigate to the home page or any other page after successful loginLoginFailure
            Navigator.of(context).pushReplacementNamed('/records');
          } else if (state is LoginUserFailure) {
            // Show an error message to the user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<LoginUserBloc, LoginUserState>(
          builder: (context, state) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Авторизация",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 398,
                    height: 52,
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(fontSize: 18, height: 1.5),
                      decoration: const InputDecoration(
                        prefix: Text("   "),
                        hintStyle: TextStyle(fontSize: 18, height: 1.5),
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 398,
                    height: 52,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: isObscure,
                      style: style,
                      decoration: InputDecoration(
                        prefix: const Text("   "),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            splashColor: const Color.fromARGB(0, 0, 0, 0),
                            hoverColor: const Color.fromARGB(0, 0, 0, 0),
                            focusColor: const Color.fromARGB(0, 0, 0, 0),
                            highlightColor: const Color.fromARGB(0, 0, 0, 0),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                              size: 23,
                            ),
                          ),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: "Пароль",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 398,
                    height: 52,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        BorderSide(color: Color(0xFF7700FF)))),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF7700FF)),
                        overlayColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 153, 74, 243)),
                      ),
                      onPressed: () {
                        // ignore: avoid_print
                        print(
                            "${_emailController.text}  ${_passwordController.text}"); //TODO Леха Сюда запрос на авторизацию

                        loginUserBloc.add(LoginEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                            ),
                            Container(
                              width: 15,
                            ),
                            Text(
                              "Продолжить",
                              style: style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 398,
                    height: 52,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        BorderSide(color: Color(0xFF7700FF)))),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF7700FF)),
                        overlayColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 153, 74, 243)),
                      ),
                      onPressed: () {
                        // ignore: avoid_print
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                            ),
                            Container(
                              width: 15,
                            ),
                            Text(
                              "Зарегистрироваться",
                              style: style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state is LoginUserLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
