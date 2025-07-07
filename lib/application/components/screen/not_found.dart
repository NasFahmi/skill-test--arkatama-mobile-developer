import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(
                FontAwesomeIcons.triangleExclamation,
                size: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Text('Page Not Found', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
