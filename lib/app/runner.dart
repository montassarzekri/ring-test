import 'package:flutter/material.dart';
import 'package:velia_test/core/router/app_router.dart';
import 'package:velia_test/core/styles/app_theme.dart';
import 'package:velia_test/features/welcome/presentation/views/welcome_view.dart';

class Runner extends StatefulWidget {
  const Runner({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RunnerState();
  }
}

class _RunnerState extends State<Runner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routing
      navigatorKey: AppRouter.key,
      initialRoute: AppRouter.welcome,
      onGenerateRoute: AppRouter.onGenerateRoute,
      // theme
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,

      theme: AppTheme.darkTheme,
    );
  }
}
