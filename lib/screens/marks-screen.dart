import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:app_tfg_dam/widgets/exercise-widget.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExerciseWidget(exercise: "Back Squat"),
              ExerciseWidget(exercise: "Front Squat"),
              ExerciseWidget(exercise: "Overhead Squat"),
              ExerciseWidget(exercise: "Squat Snatch"),
              ExerciseWidget(exercise: "Deadlift"),
              ExerciseWidget(exercise: "Clean & Jerk"),
              ExerciseWidget(exercise: "Squat Clean"),
              ExerciseWidget(exercise: "Push Jerk"),
              ExerciseWidget(exercise: "Power Clean"),
              ExerciseWidget(exercise: "Power Snatch"),
              ExerciseWidget(exercise: "Push Press"),
              ExerciseWidget(exercise: "Thruster"),
              ExerciseWidget(exercise: "Cluster"),
              ExerciseWidget(exercise: "Hang Power Clean"),
              ExerciseWidget(exercise: "Hang Power Snatch"),
              ExerciseWidget(exercise: "Hang Squat Clena"),
              ExerciseWidget(exercise: "Split Jerk"),
              ExerciseWidget(exercise: "Bench Press"),
              ExerciseWidget(exercise: "Shoulder Press"),
            ],
          ),
        ),
      ),
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
