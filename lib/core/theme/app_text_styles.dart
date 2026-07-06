import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  //FontWeights: Regular/Medium/SemiBold/Bold
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  //HEADINGS

  static const TextStyle h1 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 40,
    fontWeight: bold,
    height: 1.0,
    letterSpacing: 0.0,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 32,
    fontWeight: bold,
    height: 1.0,
    letterSpacing: 0.0,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 24,
    fontWeight: bold,
    height: 1.35,
    letterSpacing: -0.72,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 20,
    fontWeight: bold,
    height: 1.4,
    letterSpacing: -0.6,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 18,
    fontWeight: bold,
    height: 1.35,
    letterSpacing: -0.54,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 16,
    fontWeight: bold,
    height: 1.5,
    letterSpacing: 0.3,
  );

  //BODY

  static const TextStyle body18Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: medium,
    height: 1.5,
    letterSpacing: 0.3,
  );

  static const TextStyle body16SemiBold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: semiBold,
    height: 1.5,
    letterSpacing: 0.0,
  );

  static const TextStyle body16Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: medium,
    height: 1.5,
    letterSpacing: 0.0,
  );

  static const TextStyle body16Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: regular,
    height: 1.5,
    letterSpacing: 0.0,
  );

  static const TextStyle body14Bold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: bold,
    height: 1.4,
    letterSpacing: 0.3,
  );

  static const TextStyle body14SemiBold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: semiBold,
    height: 1.4,
    letterSpacing: 0.0,
  );

  static const TextStyle body14Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: medium,
    height: 1.4,
    letterSpacing: 0.0,
  );

  static const TextStyle body14Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: regular,
    height: 1.4,
    letterSpacing: 0.0,
  );

  static const TextStyle body12Bold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: bold,
    height: 1.35,
    letterSpacing: 0.3,
  );

  static const TextStyle body12SemiBold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: semiBold,
    height: 1.35,
    letterSpacing: 0.0,
  );

  static const TextStyle body12Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: medium,
    height: 1.35,
    letterSpacing: 0.0,
  );

  static const TextStyle body12Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: regular,
    height: 1.35,
    letterSpacing: 0.0,
  );
}