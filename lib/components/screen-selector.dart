import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:app_tfg_dam/defaults/app_text_styles.dart';
import 'package:flutter/material.dart';

class ScreenSelector extends StatefulWidget {
  const ScreenSelector({super.key});

  @override
  State<ScreenSelector> createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16 ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selectedOption == "marks"
              ? AppColors.backgroundComponentSelected
              : AppColors.backgroundComponent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/rm.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Mejores marcas".toUpperCase(),
                style: AppTextStyles.bodyText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
