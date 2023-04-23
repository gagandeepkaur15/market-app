import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  TextEditingController _title = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 12, 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.sell,
                          color: Color.fromARGB(225, 248, 86, 88),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Sell an Item',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Herold Towers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Title*',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _title,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'title',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(144, 255, 255, 255),
                        ),
                        fillColor: const Color.fromARGB(255, 31, 34, 42),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Category*',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _title,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'category',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(144, 255, 255, 255),
                        ),
                        fillColor: const Color.fromARGB(255, 31, 34, 42),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _title,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText:
                            'describe the condition of the item and terms of buying...\n"slightly used, almost new"\n"pickup on weekends only"',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(144, 255, 255, 255),
                        ),
                        fillColor: const Color.fromARGB(255, 31, 34, 42),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Price*',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _title,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'price',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(144, 255, 255, 255),
                        ),
                        fillColor: const Color.fromARGB(255, 31, 34, 42),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                width: double.infinity,
                height: 12.h,
                color: const Color.fromARGB(255, 24, 26, 32),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Color.fromARGB(225, 246, 239, 237),
                        ),
                        height: 6.h,
                        width: 41.w,
                        child: const Center(
                          child: Text(
                            'Discard',
                            style: TextStyle(
                                color: Color.fromARGB(225, 248, 86, 88)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Color.fromARGB(225, 248, 86, 88),
                        ),
                        height: 6.h,
                        width: 41.w,
                        child: const Center(
                          child: Text(
                            'Create Post',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
