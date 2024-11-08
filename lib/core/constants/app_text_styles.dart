import 'package:flutter/material.dart';

class AppTextStyles {
  // Regular Text
  static const smallRegular = TextStyle(
    fontSize: 12,
  );
  static const regular = TextStyle(
    fontSize: 14,
  );
  static const mediumRegular = TextStyle(
    // fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static const aboveMediumRegular = TextStyle(
    fontSize: 18,
  );
  static const largeRegular = TextStyle(
    fontSize: 22,
  );

  // Bold Text
  static const smallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static const bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  static const mediumBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const aboveMediumBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const largeBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  // Colored Text
  static const greyText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.grey,
  );
  static const greyBoldText = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.grey,
  );
  static const lightBold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.white,
  );
}
