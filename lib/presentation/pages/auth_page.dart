import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
        fontSize: 18, color: Colors.grey, height: 2);
    bool isObscure = true;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Authorization"),
            TextField(
              style: TextStyle(fontSize: 18, height: 1.5),
              decoration: InputDecoration(
                prefix: Text("   "),
                hintStyle: TextStyle(fontSize: 18, height: 1.5),
                hintText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            Container(
              width: 398,
              height: 52,
              child: TextField(
                obscureText: isObscure,
                style: style,
                decoration: InputDecoration(
                  prefix: const Text("   "),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      splashColor: Color.fromARGB(0, 0, 0, 0),
                      hoverColor: Color.fromARGB(0, 0, 0, 0),
                      focusColor: Color.fromARGB(0, 0, 0, 0),
                      highlightColor: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
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
          ],
        ),
      ),
    );
  }
}
