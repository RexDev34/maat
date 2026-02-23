import 'package:flutter/material.dart';
import 'package:maat/features/auth/presentation/login_screen.dart';

void main() {
  runApp(const MaatApp());
}

class MaatApp extends StatelessWidget {
  const MaatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maat - Business Management Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),

      home: const LoginScreen(),
    );
  }
}
