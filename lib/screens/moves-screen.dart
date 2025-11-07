import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:flutter/material.dart';

class MovesScreen extends StatefulWidget {
  const MovesScreen({super.key});

  @override
  State<MovesScreen> createState() => _MovesScreenState();
}

class _MovesScreenState extends State<MovesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarMethod(),
      body: Center(child: Text("Moves Screen")),
    );
  }

  
  }

  AppBar AppBarMethod() {
    return AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.white,
        title: Text(
          "Tutoriales de Movimientos",
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