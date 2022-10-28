import 'package:flutter/material.dart';

import '../utils/utils.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colors.primaryColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colors.primaryColor,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: styles.lightSmall(),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: colors.primaryColor,
            )
          : null,
    );
  }
}
