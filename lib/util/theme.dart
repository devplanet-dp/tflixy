import 'package:flutter/material.dart';

import 'colors.dart';

class CustomAppTheme{

  ThemeData _themeData;

  CustomAppTheme(){
    this._themeData = _buildFormAppTheme();
  }

  ThemeData get data{
    return _themeData;
  }

  ThemeData _buildFormAppTheme(){

    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor:  mBlack,
      primaryColor: mBlack,
      scaffoldBackgroundColor: mWhite,
      cardColor: mWhite,
      errorColor: mFormErrorRed,
      textTheme: _buildFormAppTextTheme(base.textTheme),
      primaryTextTheme: _buildFormAppTextTheme(base.textTheme),
      accentTextTheme: _buildFormAppTextTheme(base.textTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: mBlack),
      unselectedWidgetColor: mBlack,
    );

  }

  TextTheme _buildFormAppTextTheme(TextTheme base)
  {
    return base.copyWith(

      headline: base.headline.copyWith(
        fontFamily: 'Lato-Bold',
        fontSize: 23.0,
        color: mFormErrorRed,
      ),
      title: base.title.copyWith(
        fontFamily: 'Lato',
        fontSize: 18.0,
        color: mBlack,
      ),

      subtitle: base.subtitle.copyWith(
        fontFamily: 'Lato',
        fontSize: 14.0,
        color: mWhite,
      ),

      caption: base.caption.copyWith(
        fontFamily: 'Lato',
        fontSize: 23.0,
        color: mWhite,
      ),

      display1: base.display1.copyWith(
        fontFamily: 'Lato',
        fontSize: 14.0,
        color: mWhite,
      ),

      button: base.button.copyWith(
        fontFamily: 'Lato',
        fontSize: 14.0,
        color: mWhite,
      ),

    );

  }
}