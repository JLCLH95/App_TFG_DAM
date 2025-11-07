import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:app_tfg_dam/screens/sing-in-screen.dart';
import 'package:app_tfg_dam/widgets/customField-input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final dniController = TextEditingController();
  final nombreController = TextEditingController();
  final apellido1Controller = TextEditingController();
  final apellido2Controller = TextEditingController();
  final telefonoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarMethod(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomfieldInput(
                    label: 'DNI (Nif,Nie,Cif)',
                    controller: dniController,
                  ),
                  CustomfieldInput(
                    label: 'Nombre',
                    controller: nombreController,
                  ),
                  CustomfieldInput(label: 'Apellido 1', controller: apellido1Controller),
                  CustomfieldInput(label: 'Apellido 2', controller: apellido2Controller),
                  CustomfieldInput(label: 'Teléfono', controller: telefonoController),
                  CustomfieldInput(label: 'Email', controller: emailController),
                  CustomfieldInput(label: 'Contraseña', controller: passwordController), 
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              registrarUsuario();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            "Crear cuenta",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Future<void> registrarUsuario() async {
    if (_formKey.currentState!.validate()) {
      try {
        // 🔹 1. Crear usuario en Firebase Authentication
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

        // 🔹 2. Guardar los datos del usuario en Firestore
        await _firestore
            .collection('usuarios')
            .doc(userCredential.user!.uid)
            .set({
              'dni': dniController.text.trim(),
              'nombre': nombreController.text.trim(),
              'apellido1': apellido1Controller.text.trim(),
              'apellido2': apellido2Controller.text.trim(),
              'telefono': telefonoController.text.trim(),
              'email': emailController.text.trim(),
              'fechaRegistro': DateTime.now(),
            });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario registrado correctamente')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SingInScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String mensaje = e.toString();
        if (e.code == 'email-already-in-use') {
          mensaje = 'Este correo ya está registrado';
        } else if (e.code == 'invalid-email') {
          mensaje = 'El formato del correo no es válido';
        } else if (e.code == 'weak-password') {
          mensaje = 'La contraseña es demasiado débil';
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(mensaje)));
      }
    }
  }
}

AppBar AppBarMethod() {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    foregroundColor: Colors.white,
    title: Text(
      "Registro de usuario",
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
