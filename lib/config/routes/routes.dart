import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:skill_test_mobile_developer/application/components/screen/home_navigation_bar.dart';
import 'package:skill_test_mobile_developer/application/components/screen/not_found.dart';
import 'package:skill_test_mobile_developer/application/features/home/screen/home.dart';
import 'package:skill_test_mobile_developer/application/features/login/screen/login.dart';
import 'package:skill_test_mobile_developer/application/features/onboard/screen/onboard.dart';
import 'package:skill_test_mobile_developer/application/features/passeger/screen/add_passager.dart';
import 'package:skill_test_mobile_developer/application/features/service/screen/add_service.dart';
import 'package:skill_test_mobile_developer/config/routes/routes_name.dart';

class Routes {
  static Route onRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutesName.onboard:
        return PageTransition(
          type: PageTransitionType.fade,
          child: Onboard(),
          settings: settings,
          duration: Duration(milliseconds: 300),
        );
      case RoutesName.login:
        return PageTransition(
          type: PageTransitionType.fade,
          child: Login(),
          settings: settings,
          duration: Duration(milliseconds: 300),
        );
      case RoutesName.home:
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeNavigationBar(),
          settings: settings,
          duration: Duration(milliseconds: 300),
        );
      case RoutesName.addPassager:
        return PageTransition(
          type: PageTransitionType.fade,
          child: AddPassager(),
          settings: settings,
          duration: Duration(milliseconds: 300),
        );
      case RoutesName.addService:
        return PageTransition(
          type: PageTransitionType.fade,
          child: AddService(),
          settings: settings,
          duration: Duration(milliseconds: 300),
        );
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: NotFound(),
          settings: settings,
          duration: Duration(milliseconds: 300),
        );
    }
  }
}
