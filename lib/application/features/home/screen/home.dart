import 'package:flutter/material.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_primary.dart';
import 'package:skill_test_mobile_developer/config/routes/routes_name.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x1FFFFFFF), Color(0x3D5659AC)],
            stops: [0.8, 0.9],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 👋 Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey Damon! 👋",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Way is the limit. Explore the world with us.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
                const SizedBox(height: 24),

                // 🔍 Search & Filter
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search Service",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                _buildTripTo(),

                const SizedBox(height: 32),

                const Text(
                  "Best Deals 🔥",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),

                // ✈️ Best Deal Card
                _buildBestCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildTripTo extends StatelessWidget {
  const _buildTripTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trip To Malang",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quota",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
              Text(
                "20 Passengger",
                style: TextStyle(color: Colors.grey.shade900, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Departure Date",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "25 Jul 2020",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 80), // Jarak antar kolom
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "11:00 - 12:00",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // garis line
          Container(width: double.infinity, height: 1, color: Colors.grey),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.addPassager);
                },
                child: Text(
                  "Add Passenger",
                  style: TextStyle(
                    color: Color(0xFF69519E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text("Close Quota", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 16),
          ButtonPrimary(
            mainButtonMessage: "Add Another Service",
            mainButton: () {
              Navigator.pushNamed(context, RoutesName.addService);
            },
          ),
        ],
      ),
    );
  }
}

class _buildBestCard extends StatelessWidget {
  const _buildBestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10:30 PM",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                  ),
                  Text(
                    "WIB",
                    style: TextStyle(color: Colors.grey.shade900, fontSize: 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5:20 PM",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                  ),
                  Text(
                    "WIB",
                    style: TextStyle(color: Colors.grey.shade900, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "28 hr 20 min",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                  ),
                  Text(
                    "2 stops",
                    style: TextStyle(color: Colors.grey.shade900, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Rp 10.000.000',
                style: TextStyle(fontSize: 16, color: Color(0xff1572D3),fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
