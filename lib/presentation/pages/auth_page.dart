import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              "Authorization",
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
              child:  TextField(
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
                // style: ButtonStyle(
                //   // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //   //     RoundedRectangleBorder(
                //   //         borderRadius: BorderRadius.circular(30.0),
                //   //         side: BorderSide(color: Color(0xFF7700FF)))),
                //   // backgroundColor: MaterialStatePropertyAll(Color(0xFF7700FF)),
                //   // overlayColor: MaterialStatePropertyAll(
                //   //     Color.fromARGB(255, 153, 74, 243)),
                // ),
                onPressed: () {
                  // ignore: avoid_print
                  print("${_emailController.text}  ${_passwordController.text}");//TODO Леха Сюда запрос на авторизацию
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
          ],
        ),
      ),
    );
  }
}
