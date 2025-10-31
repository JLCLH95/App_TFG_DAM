import 'package:app_tfg_dam/defaults/app-colors.dart';
import 'package:app_tfg_dam/screens/main-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  //Controladores para los campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Instancia de FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool cargando = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      //LOGO
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/logo.png',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 50),

        //CAMPO EMAIL
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Introduce email',
              //Cambios en bordes
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.backgroundColor),
              ),

              prefixIcon: Icon(Icons.email),
              filled: true,
            ),
          ),
        ),

        //CAMPO CONTRASEÑA
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Introduce contraseña',
              //Cambios en bordes
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.backgroundColor),
              ),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.password),
              filled: true,
            ),
          ),
        ),

        //BOTÓN INICIAR SESIÓN
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: cargando
                      ? null
                      : () async {
                          setState(() {
                            cargando = true;
                          });

                          try {
                            await _auth.signInWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => const mainScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            String message = 'Error al iniciar sesión';
                            if (e.code == 'user-not-found') {
                              message = 'No existe un usuario con ese correo';
                            } else if (e.code == 'wrong-password') {
                              message = 'Contraseña incorrecta';
                            }
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          } finally {
                            setState(() => cargando = false);
                          }
                        },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.primaryColor,
                    ),
                  ),
                  child: Text(
                    "Iniciar Sesión",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),

        //BOTÓN REGISTRARSE
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.primaryColor,
                    ),
                  ),
                  child: Text(
                    "Registrarse",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 150),
      ],
    );
  }
}
