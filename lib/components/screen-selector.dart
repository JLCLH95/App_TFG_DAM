import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:app_tfg_dam/defaults/app_text_styles.dart';
import 'package:app_tfg_dam/screens/marks-screen.dart';
import 'package:app_tfg_dam/screens/moves-screen.dart';
import 'package:app_tfg_dam/screens/profile-screen.dart';
import 'package:app_tfg_dam/screens/sing-in-screen.dart';
import 'package:flutter/material.dart';

class ScreenSelector extends StatefulWidget {
  final String imgPath;
  final String txtSection;
  final String optionKey;

  const ScreenSelector({
    super.key,
    required this.imgPath,
    required this.txtSection,
    required this.optionKey,
  });

  @override
  State<ScreenSelector> createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  String? selectedOption;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [SelectionOption(context, widget.optionKey)],
    );
  }

  GestureDetector SelectionOption(BuildContext context, String option) {
    return GestureDetector(
      onTap: () {
        setState(() => isSelected = !isSelected);

        switch (widget.optionKey) {
          case 'marks':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MarksScreen()),
            );
            break;
          case 'tutorials':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MovesScreen()),
            );
            break;

          case 'profile':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
            break;

          // Add more cases here for other options if needed
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selectedOption == option
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
                      widget.imgPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.txtSection.toUpperCase(),
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
