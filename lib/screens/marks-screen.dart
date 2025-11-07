import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:flutter/material.dart';

class MarksScreen extends StatefulWidget {
  const MarksScreen({super.key});

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarMethod(),
      body: Center(child: Text("Marks Screen")),
    );
  }
}

AppBar AppBarMethod() {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    foregroundColor: Colors.white,
    title: Text(
      "Mejores Marcas",
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
  );
}
