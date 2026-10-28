import 'package:flutter/material.dart';
import 'package:velia_test/features/signup/presentation/widgets/w_sugnup_step.dart';

class WPasswordSignupStep extends StatefulWidget {
  const WPasswordSignupStep({
    super.key,
    required this.passwordController,
    required this.confirmController,
    required this.onChanged,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmController;
  final ValueChanged<String> onChanged;

  @override
  State<WPasswordSignupStep> createState() => _WPasswordSignupStepState();
}

class _WPasswordSignupStepState extends State<WPasswordSignupStep> {
  bool _passwordVisible = false;
  bool _confirmVisible = false;

  @override
  Widget build(BuildContext context) {
    final password = widget.passwordController.text;

    return WSignUpStep(
      title: 'Set up a password',
      subtitle: 'Must be at least 8 characters',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.passwordController,
            obscureText: !_passwordVisible,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => _passwordVisible = !_passwordVisible);
                },
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: widget.confirmController,
            obscureText: !_confirmVisible,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => _confirmVisible = !_confirmVisible);
                },
                icon: Icon(
                  _confirmVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _PasswordRequirements(password: password),
        ],
      ),
    );
  }
}

class _PasswordRequirements extends StatelessWidget {
  const _PasswordRequirements({required this.password});

  final String password;

  @override
  Widget build(BuildContext context) {
    final checks = {
      '1 lowercase letter': RegExp(r'[a-z]').hasMatch(password),
      '1 number': RegExp(r'[0-9]').hasMatch(password),
      '1 uppercase letter': RegExp(r'[A-Z]').hasMatch(password),
      '1 special character': RegExp(r'[^A-Za-z0-9]').hasMatch(password),
      '8 characters': password.length >= 8,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in checks.entries)
          Text('${entry.value ? '✓' : '×'} ${entry.key}'),
      ],
    );
  }
}
