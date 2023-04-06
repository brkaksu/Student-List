import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double dynamicWitdth(double val) => MediaQuery.of(this).size.width * val;
  double getWidth() => MediaQuery.of(this).size.width;
  double getHeight() => MediaQuery.of(this).size.height;
}
