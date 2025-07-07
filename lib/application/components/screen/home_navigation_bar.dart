import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:skill_test_mobile_developer/application/features/home/screen/home.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const Center(child: Text("Notification")),
    const Center(child: Text("Profile")),
    const Center(child: Text("Menu")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        // gradient: const LinearGradient(
        //   colors: [Color(0xFFFB4A4A), Color(0xFF2027CC)],
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        // ),
        backgroundColor: Colors.white,
        activeColor: Colors.black, // color gradient disini
        color: Colors.white,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          TabItem(
            icon: _selectedIndex == 0
                ? GradientIcon(
                    icon: Icons.home,
                    size: 24,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFB4A4A), Color(0xFF2027CC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : const Icon(Icons.home),
            title: 'Home',
          ),

          TabItem(
            icon: _selectedIndex == 1
                ? GradientIcon(
                    icon: Icons.notifications_none,
                    size: 24,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFB4A4A), Color(0xFF2027CC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : const Icon(Icons.notifications_none),
            title: 'Home',
          ),

          TabItem(
            icon: _selectedIndex == 2
                ? GradientIcon(
                    icon: Icons.person_outline,
                    size: 24,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFB4A4A), Color(0xFF2027CC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : const Icon(Icons.person_outline),
            title: 'Home',
          ),

          TabItem(
            icon: _selectedIndex == 3
                ? GradientIcon(
                    icon: Icons.menu,
                    size: 24,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFB4A4A), Color(0xFF2027CC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : const Icon(Icons.menu),
            title: 'Home',
          ),
        ],
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Gradient gradient;

  const GradientIcon({
    super.key,
    required this.icon,
    required this.size,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(icon, size: size),
    );
  }
}

