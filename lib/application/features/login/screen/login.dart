import 'package:flutter/material.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_primary.dart';
import 'package:skill_test_mobile_developer/config/assets/images.dart';
import 'package:skill_test_mobile_developer/config/routes/routes_name.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1572D3), // Blue background
      resizeToAvoidBottomInset:true,
      body: SafeArea(
        child: SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(

              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        // Background base blue
                        Container(
                          width: double.infinity,
                          height: 300,
                          color: const Color(0xFF1572D3),
                        ),
                        Positioned(
                          top: 32,
                          left: 32,
                          child: Image.asset(
                            Images.logo, // logo image path
                            height: 48,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 40,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text(
                                  "Selamat Datang di",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Travel Jaya",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 32, right: 32, top: 40),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24),
                            child: const Text(
                              "Login Akun",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff545455),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: const Text(
                              "Sign in to enjoy the best managing experience",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 24),
              
                          // Username
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFF2563EB), // Icon biru
                              ),
                              hintText: "Username",
                              filled: true,
                              fillColor: Colors.white, // Background textfield
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFF6F6F6),
                                ), // Border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFF6F6F6),
                                ), // Saat fokus
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
              
                          // Password
                          TextField(
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Color(0xFF2563EB), // Icon biru
                              ),
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.white, // Background textfield
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xFF2563EB), // Icon toggle
                                ),
                                onPressed: () {
                                  setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  );
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFF6F6F6),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFF6F6F6),
                                ),
                              ),
                            ),
                          ),
              
                          const SizedBox(height: 12),
              
                          // Remember me & Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: true, onChanged: (_) {}),
                                  const Text("Remember me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Color(0xFF1572D3)),
                                ),
                              ),
                            ],
                          ),
              
                          const SizedBox(height: 16),
              
                          // Login Button
                          ButtonPrimary(
                            mainButtonMessage: "Login",
                            mainButton: () {
                              Navigator.pushNamed(context, RoutesName.home);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
