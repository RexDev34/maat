import 'package:flutter/material.dart';
import 'package:maat/helpers/color_palethe.dart';

class RightSideLoginWidget extends StatelessWidget {
  const RightSideLoginWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: backgroundColor,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            SizedBox(
              child: Positioned.fill(
                child: Image.asset(
                  'images/maat_logo.png',
                  width: 160,
                  height: 100,
                ),
              ),
            ),
            
            SizedBox(height: 30,),

            // Content
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    
                  Text('Start building a smarter business with MAAT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white 
                    ),
                  ),

                  SizedBox(height: 10),
        
                  Text('Welcome back! Please sign in to continue ...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: subtitleColor,
                    ),
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: const Color.fromARGB(204, 191, 191, 191),
                        width: 2,

                      ),
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 36),
                      elevation: 4,
                      backgroundColor: Colors.transparent,

                      shadowColor: strokeColor,

                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Image.asset('icons/google.png',
                          width: 24,
                          height: 24,
                        
                        ),

                        // SizedBox(width: 10),

                        // Text('Sign in with Google',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.black87
                        //   ),

                        // ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}