import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velia_test/core/router/app_router.dart';
import 'package:velia_test/features/signup/presentation/widgets/w_email_signup_step.dart';
import 'package:velia_test/features/signup/presentation/widgets/w_password_signup_step.dart';
part 'signup_view_props.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends SignupViewProps {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_page > 0)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: _back,
                  icon: const Icon(Icons.arrow_back),
                ),
              ),

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  WEmailSignupStep(
                    controller: _emailController,
                    onChanged: (_) => setState(() {}),
                  ),
                  WPasswordSignupStep(
                    passwordController: _passwordController,
                    confirmController: _confirmPasswordController,
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _canContinue ? _next : null,
                  child: Text(_page == 3 ? 'Continue' : 'Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
