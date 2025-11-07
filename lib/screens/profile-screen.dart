import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarMethod(),
      body: Center(child: Text("Profile Screen")),
    );
  }

  AppBar AppBarMethod() {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: Colors.white,
      title: Text(
        "Perfil",
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
}
