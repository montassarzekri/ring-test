import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ExtBuildcontext on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
}
