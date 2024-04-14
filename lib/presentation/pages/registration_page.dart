import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_checkdoc/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_checkdoc/service_locator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isObscure = true;
  bool isObscureSec = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerConfirm =
      TextEditingController();
  bool passErr = false;
  TextStyle style =
      const TextStyle(fontSize: 18, color: Colors.grey, height: 2);

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            // Navigate to the home page or any other page after successful loginLoginFailure
            String sessionId = state.registerResponse.id;
            getIt<GlobalVariables>().globalVariable = sessionId;
            Navigator.of(context).pushReplacementNamed('/login');
          } else if (state is RegisterFailure) {
            // Show an error message to the user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  const Text(
                    "Registration",
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
                    child: TextField(
                      controller: _passwordControllerConfirm,
                      obscureText: isObscureSec,
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
                                isObscureSec = !isObscureSec;
                              });
                            },
                            icon: Icon(
                              isObscureSec
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                              size: 23,
                            ),
                          ),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: "Подтвердите Пароль",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  if (passErr)
                    const Text(
                      "Пароли не совпадают, проверьте пароли еще раз",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 398,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // ignore: avoid_print
                        if (_passwordController.text ==
                            _passwordControllerConfirm.text) {
                          //TODO Леха Сюда запрос на регистррацию
                            registerBloc.add(RegisterUserEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                        } else {
                          setState(() {
                            passErr = true;
                          });
                        }
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
                  if (state is RegisterLoading)
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
