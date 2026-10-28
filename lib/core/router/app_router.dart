import 'package:flutter/material.dart';
import 'package:velia_test/features/ring/ring.dart' show RingFlowView;
import 'package:velia_test/features/signup/signup.dart' show SignupView;
import 'package:velia_test/features/tips/tips.dart' show TipsView;
import 'package:velia_test/features/welcome/welcome.dart' show WelcomeView;

abstract final class AppRouter {
  static const welcome = '/';
  static const tips = '/tips';
  static const signup = '/signup';
  static const ringFlow = '/ringFlow';

  static final key = GlobalKey<NavigatorState>();
  static NavigatorState get _nav => key.currentState!;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      AppRouter.welcome => const WelcomeView(),

      AppRouter.tips => const TipsView(),
      AppRouter.ringFlow => const RingFlowView(),
      AppRouter.signup => const SignupView(),

      _ => throw ArgumentError.value(settings.name, 'route', 'Unknown route'),
    };
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }

  static Future<T?> push<T>(String route, {Object? args}) =>
      _nav.pushNamed<T>(route, arguments: args);

  static Future<T?> replace<T>(String route, {Object? args}) =>
      _nav.pushReplacementNamed<T, Object?>(route, arguments: args);
  static Future<T?> replaceAll<T>(String route, {Object? args}) =>
      _nav.pushNamedAndRemoveUntil<T>(route, (route) => false, arguments: args);

  static Future<T?> reset<T>(String route, {Object? args}) =>
      _nav.pushNamedAndRemoveUntil<T>(route, (_) => false, arguments: args);

  static void pop<T>([T? result]) => _nav.pop<T>(result);
}
