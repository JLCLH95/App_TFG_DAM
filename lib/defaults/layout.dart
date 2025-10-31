import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // El contenido específico de cada pantalla

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(child: Center(child: child)),
    );
  }
}
