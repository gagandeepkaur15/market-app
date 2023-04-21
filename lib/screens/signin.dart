import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_divider/text_divider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 12, 15),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 29.h,
              width: 29.h,
              child: Image.asset('assets/signin.png'),
            ),
            SizedBox(
              height: 1.h,
            ),
            const Text(
              "Lets's get you in",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color.fromARGB(225, 53, 56, 63),
              ),
              height: 8.h,
              width: 55.h,
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/lp');
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 30,
                      ),
                    ),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color.fromARGB(225, 53, 56, 63),
              ),
              height: 8.h,
              width: 55.h,
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/lp');
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 30,
                      ),
                    ),
                    const Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            TextDivider.horizontal(
              text: const Text(
                'or',
                style: TextStyle(color: Colors.white),
              ),
              color: const Color.fromARGB(138, 255, 255, 255),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'signin2');
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color.fromARGB(225, 248, 86, 88),
                ),
                height: 8.h,
                width: 55.h,
                child: GestureDetector(
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      'Sign in with Email',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(225, 248, 86, 88),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
