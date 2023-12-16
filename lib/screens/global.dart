import 'package:bloc_app/common/services/storage_serivce.dart';
import 'package:bloc_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Global {
  static StorageService? storageService;
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = StorageService();
    await storageService?.init();
  }
}
