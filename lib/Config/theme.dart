
import 'package:flutter/material.dart';

import 'colors.dart';

var darkTheme = ThemeData(
  brightness:Brightness.dark,
  useMaterial3:true,
  appBarTheme:const AppBarTheme(
    backgroundColor:dBackgroundColor,
  ),
  inputDecorationTheme:InputDecorationTheme(
    fillColor:dBackgroundColor,
    filled:true,
    border:UnderlineInputBorder(
      borderSide:BorderSide.none,
      borderRadius:BorderRadius.circular(10),
    ),
  ),
  colorScheme:const ColorScheme.dark(
    
    primary:dPrimaryColor,
    onPrimary:dOnBackgroundColor,
    surface:dBackgroundColor,
    onSurface:dOnBackgroundColor,
    primaryContainer:dContainerColor,
    onPrimaryContainer:dOnContainerColor,
  ),

  textTheme:const TextTheme(
    headlineLarge:TextStyle(
        fontSize:30,
        color:dPrimaryColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w800
    ),
    headlineMedium:TextStyle(
        fontSize:28,
        color:dOnBackgroundColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w600
    ),
    headlineSmall:TextStyle(
        fontSize:16,
        color:dOnBackgroundColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w600
    ),
    labelLarge:TextStyle(
        fontSize:16,
        color:dOnContainerColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w400
    ),
    labelMedium:TextStyle(
        fontSize:12,
        color:dOnContainerColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w400
    ),
    labelSmall:TextStyle(
        fontSize:10,
        color:dOnContainerColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w300
    ),
    bodyLarge:TextStyle(
        fontSize:15,
        color:dOnBackgroundColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w500
    ),
    bodyMedium:TextStyle(
        fontSize:12,
        color:dOnBackgroundColor,
        fontFamily:"Poppins",
        fontWeight:FontWeight.w400
    ),
  ),
);