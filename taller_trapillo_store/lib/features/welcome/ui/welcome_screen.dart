import 'package:flutter/material.dart';
import 'package:taller_trapillo_store/core/features/app_colors.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../lobby_store/ui/screens/lobby_store_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.title_app), backgroundColor: AppColors.primary),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localizations.welcome_title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: localizations.txt_user,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: localizations.txt_passw,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.secondary, // Botón ocupa todo el ancho
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LobbyStoreScreen()),
                );
              },
              child: Text(
                localizations.button_enter,
                style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
