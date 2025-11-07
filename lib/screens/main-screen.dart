import 'package:app_tfg_dam/components/screen-selector.dart';
import 'package:app_tfg_dam/defaults/layout.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child:ListView(
        children: [
          ScreenSelector(imgPath: 'assets/images/rm.png',txtSection:"Mejores marcas", optionKey: 'marks',),
          ScreenSelector(imgPath: 'assets/images/tutorial.jpg', txtSection: 'Movimientos', optionKey: 'tutorials',),
          ScreenSelector(imgPath: 'assets/images/profile.jpg', txtSection: 'Perfil', optionKey: 'profile',),
        ],
      ),
    );
  }
}
