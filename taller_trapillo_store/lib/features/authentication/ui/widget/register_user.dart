import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taller_trapillo_store/core/routing/app_routes.dart';

import '../../../../core/features/app_colors.dart';
import '../../../../core/widgets/text_form_widget.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../data/models/user_registration_model.dart';
import '../view_models/registration_view_model.dart';

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
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    countryController.dispose();
    super.dispose();
  }

  Future<void> _handleRegistration() async {
    if (!_formKey.currentState!.validate()) return;

    // Validar que las contraseñas coincidan
    if (passwordController.text != confirmPasswordController.text) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.validationPasswordsDoNotMatch),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return;
    }

    final userRegistration = UserRegistration(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      username: usernameController.text.trim().isEmpty ? null : usernameController.text.trim(),
      phone: phoneController.text.trim().isEmpty ? null : phoneController.text.trim(),
      address: addressController.text.trim().isEmpty ? null : addressController.text.trim(),
      country: countryController.text.trim().isEmpty ? null : countryController.text.trim(),
    );

    try {
      final result = await ref
          .read(registrationViewModelProvider.notifier)
          .registerUser(userRegistration);

      if (!mounted) return;

      if (result.success) {
        // Limpiar formulario
        _clearForm();

        // Navegar al login
        context.goToLogin();

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.msgRegistrationSuccess),
            backgroundColor: AppColors.success,
          ),
        );
      } else {
        // Mostrar error específico
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.error ?? AppLocalizations.of(context)!.msgRegistrationError),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.errorUnexpected}: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    usernameController.clear();
    phoneController.clear();
    addressController.clear();
    countryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    // Escuchar cambios en el estado del registro
    ref.listen(registrationViewModelProvider, (previous, next) {
      if (next.hasError && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString()), backgroundColor: AppColors.error),
        );
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Nombre
                TextFormWidget(
                  controller: nameController,
                  label: localizations.txtName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationEnterName;
                    }
                    return null;
                  },
                ),

                // Nombre de usuario
                TextFormWidget(
                  controller: usernameController,
                  label: localizations.username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationEnterUsername;
                    }
                    return null;
                  },
                ),

                // Correo
                TextFormWidget(
                  controller: emailController,
                  label: localizations.txtEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return localizations.validationEnterValidEmail;
                    }
                    return null;
                  },
                ),

                // Teléfono
                TextFormWidget(
                  controller: phoneController,
                  label: localizations.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationEnterPhone;
                    }
                    return null;
                  },
                ),

                // Dirección
                TextFormWidget(
                  controller: addressController,
                  label: localizations.address,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationEnterAddress;
                    }
                    return null;
                  },
                ),

                // País
                TextFormWidget(
                  controller: countryController,
                  label: localizations.country,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationEnterCountry;
                    }
                    return null;
                  },
                ),

                // Contraseña
                TextFormWidget(
                  controller: passwordController,
                  label: localizations.txt_passw,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationPleaseEnterPassword;
                    }
                    if (value.length < 6) {
                      return localizations.validationPasswordMinLength6Chars;
                    }
                    return null;
                  },
                ),

                // Confirmar contraseña
                TextFormWidget(
                  controller: confirmPasswordController,
                  label: localizations.txtConfirmPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.validationPleaseConfirmPassword;
                    }
                    if (value != passwordController.text) {
                      return localizations.validationPasswordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) {
                    final registrationState = ref.watch(registrationViewModelProvider);

                    return ElevatedButton(
                      onPressed: registrationState.isLoading ? null : () => _handleRegistration(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.backgroundWhite,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child:
                          registrationState.isLoading
                              ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.backgroundWhite,
                                  ),
                                ),
                              )
                              : Text(
                                localizations.txtRegister,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
