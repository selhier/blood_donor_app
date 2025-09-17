import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart'; // Este archivo se genera al configurar Firebase
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Escucha el estado del usuario de Firebase Auth
    final user = context.watch<User?>();

    // Si el usuario no es nulo, está logueado y mostramos la pantalla de inicio.
    if (user != null) {
      return const HomeScreen();
    }
    // Si el usuario es nulo, no está logueado y mostramos la pantalla de login.
    else {
      return const LoginScreen();
    }
  }
}

Future<void> main() async {
  // Asegura que los widgets de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa Firebase con las opciones de la plataforma actual
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provee el estado del usuario. Firebase automáticamente notifica los cambios.
        StreamProvider<User?>(
          create: (context) => FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blood App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.red),
          ),
        ),
        // Define las rutas para la navegación
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthWrapper(),
          '/register': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}