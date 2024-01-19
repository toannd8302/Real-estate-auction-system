
import 'package:flutter/material.dart';

class TextStyles {
  TextStyles(this.context);
  BuildContext? context;

  static const TextStyle defaultTextStyle = TextStyle(
    //color: ColorPalette.subtitleColor,
    fontWeight: FontWeight.w400,
    height: 16 / 14,
  );
}

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle get regular {
    return copyWith(
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get intalic {
    return copyWith(
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get bold {
    return copyWith(
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get semiBold {
    return copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get medium {
    return copyWith(
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get fontHeader {
    return copyWith(
      fontSize: 22,
      height: 22 / 20,
    );
  }

  TextStyle get fontCaption {
    return copyWith(
      fontSize: 12,
      height: 12 / 10,
    );
  }

  TextStyle get text1Color {
    return copyWith(
    //
    );
  }

  TextStyle get whiteTextColor {
    return copyWith(
      color: Colors.white,
    );
  }
}
