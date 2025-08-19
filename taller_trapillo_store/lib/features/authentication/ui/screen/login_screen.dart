import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taller_trapillo_store/core/features/app_colors.dart';
import 'package:taller_trapillo_store/core/routing/app_routes.dart';
import 'package:taller_trapillo_store/l10n/generated/app_localizations.dart';
import '../view_models/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(loginViewModelProvider.notifier)
        .loginUser(email: _emailController.text.trim(), password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      if (!mounted) return;

      switch (next) {
        case LoginState.success:
          ref.read(loginViewModelProvider.notifier).resetState();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(localizations.msgLoginSuccess),
              backgroundColor: AppColors.success,
              duration: Duration(seconds: 1),
            ),
          );
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted && context.mounted) context.goToStore();
          });
          break;
        case LoginState.error:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(localizations.msgAuthenticationError),
              backgroundColor: AppColors.error,
            ),
          );
          break;
        case LoginState.initial:
        case LoginState.loading:
          break;
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(localizations.title_app), backgroundColor: AppColors.primary),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations.welcome_title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: localizations.lblEmail,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return localizations.validationPleaseEnterEmail;
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
                    return localizations.validationEmailInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: localizations.txt_passw,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.validationPleaseEnterPassword;
                  }
                  if (value.length < 6) {
                    return localizations.validationPasswordMinLength6;
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.goToRegister();
                  },
                  child: Text(
                    localizations.txtRegister,
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Consumer(
                builder: (context, ref, child) {
                  final loginState = ref.watch(loginViewModelProvider);

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: AppColors.secondary,
                    ),
                    onPressed: loginState == LoginState.loading ? null : _handleLogin,
                    child:
                        loginState == LoginState.loading
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textPrimary),
                              ),
                            )
                            : Text(
                              localizations.button_enter,
                              style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
                            ),
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
