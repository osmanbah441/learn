import 'package:flutter/material.dart';

final class AppTheme {
  static const _dataTableTheme = DataTableThemeData(dividerThickness: 0);

  static get theme => ThemeData(
        brightness: Brightness.dark,
        dataTableTheme: _dataTableTheme,
      );
}
