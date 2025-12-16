import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Expenses.dart';


var kcoloescmee= ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kdarkcolorsceme= ColorScheme.fromSeed(
  brightness: Brightness.dark,
    seedColor:Color.fromARGB(255, 3, 99, 125));

void main (){
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kdarkcolorsceme,
      cardTheme: CardThemeData().copyWith(
        color: kdarkcolorsceme.onSecondaryContainer,
        margin: EdgeInsets.all(2),
      ),
        primaryTextTheme: TextTheme().copyWith(
          titleLarge: TextStyle().copyWith(
            color: kdarkcolorsceme.secondaryContainer
          )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
            backgroundColor: kdarkcolorsceme.onPrimaryContainer,
            foregroundColor: kdarkcolorsceme.onError
        ),


        ),

        textTheme: ThemeData().textTheme.copyWith(

            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
            )
        ),



    ),

    theme: ThemeData().copyWith(
      colorScheme: kcoloescmee,

      appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kcoloescmee.onPrimaryContainer,
                foregroundColor: kcoloescmee.primaryContainer
          ),

        cardTheme: CardThemeData().copyWith(
          color: kcoloescmee.secondaryContainer,
          margin: EdgeInsets.all(2)

    ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        backgroundColor: kcoloescmee.onPrimaryContainer,
            foregroundColor: kcoloescmee.onError

      )),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        )
      ),

    ),

    home: Expenses(),
  ));
}