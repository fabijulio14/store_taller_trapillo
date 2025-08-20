import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/features/app_colors.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../view_models/profile_view_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar el perfil del usuario una sola vez al inicializar
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Future.microtask(() {
        ref.read(profileNotifierProvider.notifier).loadUserProfile(currentUser.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final localizations = AppLocalizations.of(context)!;
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.profile), backgroundColor: AppColors.primary),
      body: Column(
        children: [
          SizedBox(height: 24),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFFAD7C8),
            child: Icon(Icons.person, size: 50, color: AppColors.backgroundWhite),
          ),
          SizedBox(height: 16),
          // Mostrar email y nombre del perfil
          profileState.when(
            data:
                (userProfile) => Column(
                  children: [
                    Text(
                      userProfile?.email ?? currentUser?.email ?? localizations.lblEmail,
                      style: TextStyle(fontSize: 16, color: AppColors.grey),
                    ),
                    if (userProfile?.name != null) ...[
                      SizedBox(height: 4),
                      Text(
                        userProfile!.name!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ],
                ),
            loading: () => CircularProgressIndicator(),
            error:
                (error, stack) => Text(
                  currentUser?.email ?? localizations.lblEmail,
                  style: TextStyle(fontSize: 16, color: AppColors.grey),
                ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    localizations.account,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                ListTile(
                  title: Text(localizations.editProfile),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  // onTap: () {}, // TODO: Implementar edición de perfil
                ),
                ListTile(
                  title: Text(localizations.addresses),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  // onTap: () {}, // TODO: Implementar gestión de direcciones
                ),
                ListTile(
                  title: Text(localizations.paymentMethods),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  // onTap: () {}, // TODO: Implementar métodos de pago
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    localizations.orders,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                ListTile(
                  title: Text(localizations.orderHistory),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  // onTap: () {}, // TODO: Implementar historial de pedidos
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    localizations.preferences,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                ListTile(
                  title: Text(localizations.notifications),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  // onTap: () {}, // TODO: Implementar configuración de notificaciones
                ),
                ListTile(
                  title: Text(localizations.language),
                  subtitle: Text(ref.read(localeProvider.notifier).getCurrentLanguageName()),
                  trailing: const Icon(Icons.language),
                  onTap: () {
                    _showLanguageDialog(context, localizations);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(localizations.country),
                      Text(
                        profileState.when(
                          data: (userProfile) => userProfile?.country ?? localizations.spain,
                          loading: () => localizations.spain,
                          error: (error, stack) => localizations.spain,
                        ),
                        style: TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, AppLocalizations localizations) {
    final localeNotifier = ref.read(localeProvider.notifier);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.selectLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(localizations.spanish),
                leading: const Icon(Icons.flag),
                onTap: () {
                  localeNotifier.changeLocale(const Locale('es', 'ES'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(localizations.english),
                leading: const Icon(Icons.flag_outlined),
                onTap: () {
                  localeNotifier.changeLocale(const Locale('en', 'US'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text(localizations.cancel)),
          ],
        );
      },
    );
  }
}
