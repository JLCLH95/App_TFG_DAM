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
          ScreenSelector(),
          ScreenSelector()
        ],
      ),
    );
  }
}
