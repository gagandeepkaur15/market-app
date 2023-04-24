import 'package:flutter/material.dart';
import 'package:goose_task/services/auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _price = TextEditingController();

  Auth _auth = Auth();

  final List<String> _imageUrls = [];
  List<File> _images = [];
  String _uploadMessage = '';

  Future<List<String>> pickImages() async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage();
    final List<String> imageUrls = [];

    List<File> pickedImagesFiles =
        pickedImages.map((XFile file) => File(file.path)).toList();
    setState(() {
      _images = pickedImagesFiles;
    });

    for (final image in pickedImages) {
      final File file = File(image.path);
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('images');
      final UploadTask uploadTask = storageReference.putFile(file);
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }

  Future<void> uploadUserData(List<String> imageUrls) async {
    final Map<String, dynamic> userData = {
      'title': _title.text,
      'category': _category.text,
      'description': _desc.text,
      'price': _price.text,
      'imageUrls': imageUrls,
    };
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    final DocumentReference userDoc =
        usersCollection.doc(_auth.currentUser!.uid);
    final CollectionReference imagesCollection = userDoc.collection('sell');
    await imagesCollection.add(userData);
  }

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
                      controller: _category,
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
                      controller: _desc,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 3,
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
                      controller: _price,
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
                height: 0.4.h,
              ),
              SizedBox(
                height: 9.8.h,
                child: _images.isEmpty
                    ? const Text('No images selected.')
                    : GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(
                          _images.length,
                          (index) => Image.file(_images[index]),
                        ),
                      ),
              ),
              SizedBox(
                height: 0.4.h,
              ),
              InkWell(
                onTap: () async {
                  await pickImages();
                },
                child: Container(
                  width: 95.w,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 31, 34, 42),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 158, 158, 158),
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      const Text(
                        'Add Photos',
                        style: TextStyle(
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: double.infinity,
                height: 12.h,
                color: const Color.fromARGB(255, 24, 26, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
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
                    ),
                    InkWell(
                      onTap: () async {
                        await uploadUserData(_imageUrls).then((value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Data Saved'),
                          ));
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
