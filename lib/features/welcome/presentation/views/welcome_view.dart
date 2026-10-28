import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velia_test/core/router/app_router.dart';
import 'package:velia_test/core/styles/app_theme.dart';
import 'package:velia_test/core/styles/theme_colors.dart';
import 'package:velia_test/core/widgets/w_app_text.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeViewState();
  }
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ThemeColors.primaryGradient),
      child: Scaffold(
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: SizedBox()),
              Row(
                children: [
                  SvgPicture.asset("assets/vectors/velia.svg"),

                  WAppText("Welcome to Velia"),
                ],
              ),
              WAppText(
                "Stay connected to everyday balance",
                variant: TextVariant.display,
              ),
              Spacer(),
              WAppText(
                "Gentle insights from a quiet companion that listens",
                variant: TextVariant.label,
                muted: true,
              ),
              SizedBox(height: 8),
              FilledButton(
                onPressed: () {
                  AppRouter.push(AppRouter.tips);
                },
                child: Text("Login"),
              ),
              SizedBox(height: 15),
              FilledButton.tonal(
                onPressed: () {
                  AppRouter.push(AppRouter.signup);
                },
                child: Text("Create an account"),
              ),
              SafeArea(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
