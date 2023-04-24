import 'package:flutter/material.dart';
import 'package:goose_task/services/auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  bool? _isChecked = false;

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
                  'Create an account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(225, 248, 86, 88),
                  controller: _username,
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
                  height: 4.h,
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(225, 248, 86, 88),
                  controller: _confirmPass,
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
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                      activeColor: const Color.fromARGB(225, 248, 86, 88),
                      fillColor: MaterialStateProperty.all<Color?>(
                        const Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 15.h,
                  color: const Color.fromARGB(255, 24, 26, 32),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        try {
                          _auth
                              .register(_email.text, _password.text,
                                  _username.text, _confirmPass.text)
                              .then((value) {
                            Navigator.pushNamed(context, '/signin2');
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
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
