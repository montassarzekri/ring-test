import 'package:flutter/material.dart';
import 'package:velia_test/core/widgets/w_app_text.dart';

class WSignUpStep extends StatelessWidget {
  const WSignUpStep({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WAppText(title, variant: TextVariant.headline),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            WAppText(subtitle!, muted: true),
          ],
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
