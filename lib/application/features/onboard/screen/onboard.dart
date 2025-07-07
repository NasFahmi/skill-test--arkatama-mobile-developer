import 'package:flutter/material.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_primary.dart';
import 'package:skill_test_mobile_developer/config/routes/routes_name.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1572D3),
              Color(0x4D1572D3),
              Color(0x1FFFFFFF),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Logo di kiri atas
              const Positioned(
                top: 16,
                left: 16,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 48,
                ),
              ),
              // Bus di kanan atas
              const Positioned(
                top: 64,
                right: 0,
                child: Image(
                  image: AssetImage('assets/images/bus.png'),
                  height: 378,
                  fit: BoxFit.fitHeight,
                ),
              ),

              // Text dan Button di bawah bus
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height /6 + 378), // Jarak logo + tinggi bus
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        Text(
                          "Your Journey Made",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff263238),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Memorable",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2563EB),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Compare and track your flights on the go. Loved by crew and passengers alike.",
                          style: TextStyle(color: Color(0xff63767E)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ButtonPrimary(
                      mainButton: () {
                        Navigator.pushNamed(context, RoutesName.login);
                      },
                      mainButtonMessage: 'Get Started',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
