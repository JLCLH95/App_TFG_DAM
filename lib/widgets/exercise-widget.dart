import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExerciseWidget extends StatefulWidget {
  final String exercise;

  const ExerciseWidget({super.key, required this.exercise});

  @override
  State<StatefulWidget> createState() => _ExerciseWidget();
}

class _ExerciseWidget extends State<ExerciseWidget> {
  final autentificacion = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> registros = [];
  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  Future<void> _loadRecords() async {
    final user = autentificacion.currentUser;
    if (user == null) return;

    final snapshot = await fireStore
        .collection("usuarios")
        .doc(user.uid)
        .collection("ejercicios")
        .doc(widget.exercise)
        .collection("registros")
        .get();

    setState(() {
      registros = snapshot.docs.map((d) => d.data()).toList();
    });
  }

  String? peso;
  String? reps;
  DateTime? fecha;

  @override
  Widget build(BuildContext context) {
    final ultimoRegistro = registros.isNotEmpty ? registros.first : null;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.backgroundComponent,
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(12),
                child: Column(
                  children: [
                    Text(
                      widget.exercise,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Peso: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '\t\t\t'),
                                  TextSpan(
                                    text: '${ultimoRegistro?["Peso"] ?? "-"}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Repeticiones: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '\t\t\t'),
                                  TextSpan(
                                    text:
                                        '${ultimoRegistro?["Repeticiones"] ?? "-"}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Fecha: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '\t\t\t'),
                                  TextSpan(
                                    text:
                                        '${ultimoRegistro?["Fecha"] != null ? (ultimoRegistro!["Fecha"] as Timestamp).toDate().day.toString() + "/" + (ultimoRegistro!["Fecha"] as Timestamp).toDate().month.toString() + "/" + (ultimoRegistro!["Fecha"] as Timestamp).toDate().year.toString() : "-"} ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    EdicionValores(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                  ),
                                  child: Text(
                                    'Añadir',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void EdicionValores(BuildContext context) {
    final TextEditingController pesoController = TextEditingController();
    final TextEditingController repController = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.backgroundComponent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                "Añadir registro",
                style: TextStyle(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    cursorColor: AppColors.primaryColor,
                    controller: pesoController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Peso",
                      labelStyle: TextStyle(color: Colors.white70),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  TextField(
                    cursorColor: AppColors.primaryColor,
                    controller: repController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Repeticiones",
                      labelStyle: TextStyle(color: Colors.white70),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor)
                      )
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        selectedDate == null
                            ? "Fecha: no seleccionada"
                            : "Fecha: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.calendar_month, color: Colors.white),
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) {
                            setState(() => selectedDate = picked);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final user = autentificacion.currentUser;
                    if (user == null) return;

                    await fireStore
                        .collection("usuarios")
                        .doc(user.uid)
                        .collection("ejercicios")
                        .doc(widget.exercise)
                        .collection("registros")
                        .add({
                          "Peso": pesoController.text,
                          "Repeticiones": repController.text,
                          "Fecha": selectedDate,
                        });

                    Navigator.pop(context);
                    _loadRecords();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: Text(
                    "Guardar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
