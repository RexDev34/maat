import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      body: Row(
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'images/login_cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Precision en Inventario y Total Control Operacional',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Color(0xFF101C23),
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            child: Column(children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
