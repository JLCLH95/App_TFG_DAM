import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:app_tfg_dam/screens/sing-in-screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            "CAN-WOD",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: ClipOval(
                child: Image.asset('assets/images/logo.png', height: 40),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        body:  Center(child: SingInScreen()),
      ),
    );
  }
}
