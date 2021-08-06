import 'package:flutter/material.dart';

const purple = Color(0xFF6B30A6);
const lightGrey = Color(0xFF495059);
const grey = Color(0xFF2A2E33);
const darkGrey = Color(0xFF15171A);
const gold = Color(0xFFC7BA67);

const textTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 96,
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w400,
    letterSpacing: -1.5,
  ),
  headline2: TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
    fontFamily: 'SFProText',
  ),
  headline3: TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProText',
  ),
  headline4: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    fontFamily: 'SFProText',
  ),
  headline5: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProText',
  ),
  headline6: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    fontFamily: 'SFProText',
  ),
  subtitle1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProText',
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    fontFamily: 'SFProText',
  ),
  bodyText1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    fontFamily: 'SFProText',
  ),
  bodyText2: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    fontFamily: 'SFProText',
  ),
  button: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    fontFamily: 'SFProText',
  ),
  caption: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    fontFamily: 'SFProText',
  ),
  overline: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    fontFamily: 'SFProText',
  ),
);

final theme = ThemeData.dark().copyWith(
  textTheme: textTheme,
  scaffoldBackgroundColor: purple,
);
