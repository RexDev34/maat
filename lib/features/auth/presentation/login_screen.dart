import 'package:flutter/material.dart';
import 'package:maat/features/auth/resources/responsive/desktop_login_body.dart';
import 'package:maat/features/auth/resources/responsive/mobile_login_body.dart';
import 'package:maat/features/auth/resources/responsive/responsive_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileResponsiveBody(),
        desktopBody: DesktopResponsiveBody(),
      ),
    );
  }
}