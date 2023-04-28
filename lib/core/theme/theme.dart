import 'package:flutter/material.dart';


ThemeData lightTheme(context) {
  
  final ThemeData base = ThemeData();

  return base.copyWith(

    brightness:  Brightness.dark,
    
    primaryColor            : const  Color.fromRGBO(254, 6, 145, 1),
    primaryColorLight       : const Color.fromRGBO(0, 122, 255, 1),
    primaryColorDark        : const Color.fromRGBO(244, 73, 83, 1),
    scaffoldBackgroundColor : const Color.fromRGBO(34, 37, 56,1),

    appBarTheme             :    const AppBarTheme(
      backgroundColor : Colors.transparent,
      elevation       : 0,
      iconTheme: IconThemeData(color: Colors.white)
    ),

    textTheme:   const TextTheme(
      headlineLarge : TextStyle(fontSize: 27, color: Color.fromRGBO(23, 19, 50, 1), fontFamily: 'Bold'),
      headlineMedium: TextStyle(fontSize: 27, color: Color.fromRGBO(23, 19, 50, 1), fontFamily: 'Medium'),
      headlineSmall : TextStyle(fontSize: 20, color: Color.fromRGBO(23, 19, 50, 1), fontFamily: 'Bold'),

      bodyLarge     :  TextStyle(height: 1.5, fontSize: 16, color: Color.fromRGBO(23, 19, 50, 1),    fontFamily: 'Medium'),
      bodyMedium    :  TextStyle(height: 1.5, fontSize: 16, color: Color.fromRGBO(171, 181, 209, 1), fontFamily: 'Medium'),
    ),
      
  );
}
