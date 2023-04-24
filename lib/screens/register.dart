import 'package:flutter/material.dart';
import 'package:goose_task/services/auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool? _isChecked = false;
  var _text = "";

  final Auth _auth = Auth();

  String? get _errorTextPass {
    final text = _password.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 6) {
      return 'Password should be 6 letters long';
    }
    return null;
  }

  String? get _errorTextConfirm {
    final text1 = _password.value.text;
    final text2 = _confirmPass.value.text;
    if (text1 != text2) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  String? get _errorTextEmail {
    final text = _email.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 7 && !text.contains('@')) {
      return 'Enter correct email';
    }
    return null;
  }

  void registerUser() {
    _auth
        .register(
            _email.text, _password.text, _username.text, _confirmPass.text)
        .then((value) {
      Navigator.pushNamed(context, '/signin2');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User Registered'),
      ));
    });
  }

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
                  decoration: InputDecoration(
                    errorText: _errorTextEmail,
                    errorStyle: const TextStyle(color: Colors.red),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                  onChanged: (text) => setState(() => _text),
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
                  decoration: InputDecoration(
                    errorText: _errorTextPass,
                    errorStyle: const TextStyle(color: Colors.red),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
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
                  decoration: InputDecoration(
                    errorText: _errorTextConfirm,
                    errorStyle: const TextStyle(color: Colors.red),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
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
                  height: 6.h,
                ),
                Container(
                  height: 15.h,
                  color: const Color.fromARGB(255, 24, 26, 32),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        try {
                          if (_email.value.text.isNotEmpty &&
                              _password.value.text.isNotEmpty &&
                              _confirmPass.value.text.isNotEmpty) {
                            registerUser();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Enter the correct values'),
                            ));
                          }
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
