import 'package:flutter/material.dart';
import 'package:blood_donor_app/screens/home_screen.dart';

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita el cintillo de debug
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
      home: const HomeScreen(),
    );
  }
}