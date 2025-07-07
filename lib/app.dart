import 'package:flutter/material.dart';
import 'package:skill_test_mobile_developer/config/routes/routes.dart';
import 'package:skill_test_mobile_developer/config/routes/routes_name.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
      ),
      initialRoute: RoutesName.onboard,
      onGenerateRoute: Routes.onRoute,
      title: 'Domain Design Driven',
    );
  }
}