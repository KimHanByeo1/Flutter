import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          userViewModelController.user.value.profileImageReference,
          width: 90 * deviceWidth / prototypeWidth,
          height: 90 * deviceWidth / prototypeWidth,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class FileStorage extends GetxController {
  late FirebaseStorage storage;
  late Reference storageRef;

  FileStorage() {
    storage = FirebaseStorage.instance;
  }

  Future<String> uploadFile(String filePath, String uploadPath) async {
    File file = File(filePath);

    try {
      storageRef = storage.ref(uploadPath);
      await storageRef.putFile(file);
      String downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } on FirebaseException catch (e) {
      return '-1';
    }
  }
}
