import 'package:flutter/material.dart';
import 'package:goose_task/widgets/bnb.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../services/auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 12, 15),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Profile Settings',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(123, 18, 209, 142),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 18, 209, 142),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  const Text(
                                    'Personal Information',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(123, 252, 169, 50),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.notifications,
                                        color:
                                            Color.fromARGB(255, 252, 168, 50),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Push Notifications',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.8,
                                      ),
                                      Text(
                                        'Receive alerts for bid activity',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(123, 59, 123, 253),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.mail,
                                        color:
                                            Color.fromARGB(255, 59, 123, 253),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Subscribe to Emails',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.8,
                                      ),
                                      Text(
                                        'Receive marketing emails',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(123, 169, 117, 100),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.info,
                                        color:
                                            Color.fromARGB(255, 169, 117, 100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  const Text(
                                    'Language',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 19.w,
                                  ),
                                  const Text(
                                    'English (US)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(123, 18, 209, 142),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.verified_user,
                                        color:
                                            Color.fromARGB(255, 18, 209, 142),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  const Text(
                                    'Change Password',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _auth.signOutFunction();
                    },
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(123, 252, 103, 105),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.logout,
                                        color:
                                            Color.fromARGB(255, 252, 103, 105),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  const Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const BNBCont(),
          ],
        ),
      ),
    );
  }
}
