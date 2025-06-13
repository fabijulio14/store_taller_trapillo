import 'package:flutter/material.dart';

import '../lobby_store.dart/lobby_store_screen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trapillo Store')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bienvenido a Trapillo Store',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: const InputDecoration(labelText: 'Usuario', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Botón ocupa todo el ancho
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LobbyStoreView()),
                );
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
