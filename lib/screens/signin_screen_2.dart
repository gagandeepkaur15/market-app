import 'package:flutter/material.dart';
import 'package:goose_task/services/auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn2 extends StatefulWidget {
  const SignIn2({super.key});

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 12, 15),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(225, 248, 86, 88),
                  controller: _email,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(225, 248, 86, 88),
                  controller: _password,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    try {
                      _auth.signIn(_email.text, _password.text).then((value) {
                        if (value != null) {
                          Navigator.pushNamed(context, '/profile');
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Could not sign in'),
                          ));
                        }
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Color.fromARGB(225, 248, 86, 88),
                    ),
                    height: 8.h,
                    width: 55.h,
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
