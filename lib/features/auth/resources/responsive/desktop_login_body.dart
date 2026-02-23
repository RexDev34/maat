import 'package:flutter/material.dart';
import 'package:maat/features/auth/widgets/login_lefft_panel.dart';
import 'package:maat/features/auth/widgets/login_right_panel.dart';

class DesktopResponsiveBody extends StatelessWidget {
  const DesktopResponsiveBody({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(

      body: Row(

        children: [

          LeftSideLoginWidget(size: size),
          RightSideLoginWidget(size: size)

        ],

      ),

    );
  }
}