import 'package:flutter/material.dart';

class LeftSideLoginWidget extends StatelessWidget {
  const LeftSideLoginWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Stack(
        children: [
          
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/login_cover.jpg',
              fit: BoxFit.cover,
            ),
          ),
    
          // Image Opacity
          Positioned(
            child: Container(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
    
          // Content
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                          
                  Text(
                    'Precision en Inventario y Total Control Operacional',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      
                    ),
                  ),
                    
                  SizedBox(height: 10),
                    
                  Text('The operating system for modern business control every workflow from end to end',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white 
                    ),
                  ),         
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}