import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String filePath,
    String fileName
  ) async {
    File file = File(filePath);

    try {
      await storage.ref("food/$fileName").putFile(file);
      
    } on firebase_core.FirebaseException catch (exc) {
      print(exc);
    }
  }

  Future<String> getUrl(String imageName) async {
    String imageUrl = await storage.ref("food/$imageName").getDownloadURL();
    
    return imageUrl;
  }
}