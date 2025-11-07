import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:flutter/material.dart';

class CustomfieldInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CustomfieldInput({super.key, required this.label, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: label == 'Contraseña' ? true : false,
            keyboardType: label == 'Email'
                ? TextInputType.emailAddress
                : TextInputType.text,
            style: TextStyle(color: AppColors.textColor),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, introduce $label';
              }

              if (label == 'Email') {
                final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                if (!emailRegex.hasMatch(value!)) {
                  return 'Introduce un email válido';
                }
              }
              return null;
            },

            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.backgroundComponent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
