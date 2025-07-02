import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/features/app_colors.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario'), backgroundColor: AppColors.primary),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Nombre
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nombre"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
                onSaved: (value) => nameController.text = value ?? '',
              ),
              // Correo
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Correo electrónico"),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Ingrese un correo válido';
                  }
                  return null;
                },
                onSaved: (value) => emailController.text = value!,
              ),
              // Contraseña
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Contraseña"),
                // validator: (value) {
                //   if (value == null || value.length < 6) {
                //     return 'La contraseña debe tener al menos 6 caracteres';
                //   }
                //   return null;
                // },
                onSaved: (value) => passwordController.text = value!,
              ),
              // Confirmar contraseña
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirmar contraseña"),
                // validator: (value) {
                //   if (value != passwordController.text) {
                //     return 'Las contraseñas no coinciden';
                //   }
                //   return null;
                // },
                onSaved: (value) => confirmPasswordController.text = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final url = Uri.https(
                      'trapillostore-20191-default-rtdb.firebaseio.com',
                      'user_list.json',
                    );
                    http.post(
                      url,
                      headers: {'Content-Type': 'application/json'},
                      body: json.encode({
                        'name': nameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                      }),
                    );
                  } // URL del endpoint de registro
                },
                child: Text("Registrarse"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
