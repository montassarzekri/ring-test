import 'package:flutter/material.dart';
import 'package:velia_test/core/router/app_router.dart';
import 'package:velia_test/features/signup/presentation/widgets/w_sugnup_step.dart';

class WEmailSignupStep extends StatelessWidget {
  const WEmailSignupStep({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WSignUpStep(
          title: "Let’s get started",
          subtitle: 'We will send you an email to confirm it',
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            autofocus: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextButton(
            child: Text(
              "Already have an account? Log in",
              style: TextStyle(color: Color(0xFF5278BC)),
            ),
            onPressed: () {
              AppRouter.replaceAll(AppRouter.welcome);
            },
          ),
        ),
      ],
    );
  }
}
