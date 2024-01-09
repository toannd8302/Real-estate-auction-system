//Todo: Create Color Constants Theme

import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  /*

Màu của khóa chính được sử dụng để xác định vai trò của 
các thành phần chính trên giao diện người dùng, chẳng hạn như FAB, 
các nút nổi bật, trạng thái 
hoạt động cũng như sắc thái của các bề mặt được nâng cao.
   */
  primary: Color(0xFF006D3D),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF86FAB0),
  onPrimaryContainer: Color(0xFF00210F),
  secondary: Color(0xFF4F6354),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD1E8D4),
  onSecondaryContainer: Color(0xFF0D1F13),
  tertiary: Color(0xFF3B6470),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBEEAF7),
  onTertiaryContainer: Color(0xFF001F26),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFDF8),
  onBackground: Color(0xFF191C1A),
  outline: Color(0xFF717971),
  onInverseSurface: Color(0xFFF0F1EC),
  inverseSurface: Color(0xFF2E312E),
  inversePrimary: Color(0xFF69DD96),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006D3D),
  outlineVariant: Color(0xFFC0C9BF),
  scrim: Color(0xFF000000),
  surface: Color(0xFFF8FAF5),
  onSurface: Color(0xFF191C1A),
  surfaceVariant: Color(0xFFDCE5DB),
  onSurfaceVariant: Color(0xFF414942),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF69DD96),
  onPrimary: Color(0xFF00391D),
  primaryContainer: Color(0xFF00522D),
  onPrimaryContainer: Color(0xFF86FAB0),
  secondary: Color(0xFFB6CCB9),
  onSecondary: Color(0xFF223527),
  secondaryContainer: Color(0xFF384B3D),
  onSecondaryContainer: Color(0xFFD1E8D4),
  tertiary: Color(0xFFA3CDDA),
  onTertiary: Color(0xFF023640),
  tertiaryContainer: Color(0xFF214C57),
  onTertiaryContainer: Color(0xFFBEEAF7),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1A),
  onBackground: Color(0xFFE1E3DE),
  outline: Color(0xFF8B938A),
  onInverseSurface: Color(0xFF191C1A),
  inverseSurface: Color(0xFFE1E3DE),
  inversePrimary: Color(0xFF006D3D),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF69DD96),
  outlineVariant: Color(0xFF414942),
  scrim: Color(0xFF000000),
  surface: Color(0xFF111411),
  onSurface: Color(0xFFC5C7C2),
  surfaceVariant: Color(0xFF414942),
  onSurfaceVariant: Color(0xFFC0C9BF),
);