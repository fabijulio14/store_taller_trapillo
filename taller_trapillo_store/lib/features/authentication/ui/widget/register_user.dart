import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taller_trapillo_store/core/routing/app_routes.dart';

import '../../../../core/features/app_colors.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../viewmodels/registration_view_model.dart';

class RegisterUser extends ConsumerStatefulWidget {
  const RegisterUser({super.key});

  @override
  ConsumerState<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends ConsumerState<RegisterUser> {
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

  Future<void> _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      final success = await ref
          .read(registrationViewModelProvider.notifier)
          .registerUser(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          );

      if (mounted) {
        if (success) {
          context.goToLogin();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.msgRegistrationSuccess)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.msgRegistrationError)),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    // Escuchar cambios en el estado del registro
    ref.listen<RegistrationState>(registrationViewModelProvider, (previous, next) {
      if (next == RegistrationState.error && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(localizations.msgRegistrationError)));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.txtUserRegistration),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Nombre
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: localizations.txtName),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.validationEnterName;
                  }
                  return null;
                },
                onSaved: (value) => nameController.text = value ?? '',
              ),
              // Correo
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: localizations.txtEmail),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return localizations.validationEnterValidEmail;
                  }
                  return null;
                },
                onSaved: (value) => emailController.text = value!,
              ),
              // Contraseña
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: localizations.txt_passw),
                onSaved: (value) => passwordController.text = value!,
              ),
              // Confirmar contraseña
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: localizations.txtConfirmPassword),
                onSaved: (value) => confirmPasswordController.text = value!,
              ),
              SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final registrationState = ref.watch(registrationViewModelProvider);

                  return ElevatedButton(
                    onPressed:
                        registrationState == RegistrationState.loading
                            ? null
                            : () => _handleRegistration(),
                    child:
                        registrationState == RegistrationState.loading
                            ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : Text(localizations.txtRegister),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
