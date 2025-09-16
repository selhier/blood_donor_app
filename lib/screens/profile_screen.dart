import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nombre del Donante',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tipo de Sangre: A+',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Divider(height: 40, color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.red),
              title: const Text('Teléfono de Contacto'),
              subtitle: const Text('809-111-2222'),
              trailing: const Icon(Icons.edit, color: Colors.grey),
              onTap: () {
                // Lógica para editar
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: const Text('Ubicación'),
              subtitle: const Text('Santo Domingo'),
              trailing: const Icon(Icons.edit, color: Colors.grey),
              onTap: () {
                // Lógica para editar
              },
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica de cerrar sesión
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}