import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// fontColor is by default Colors.white
class VerticalText extends Text {
  final String text;
  @override
  // final TextStyle? style;
  VerticalText(
    this.text, {
    super.key,
    // TextStyle? style,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    // super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          _rotate(text),
          style: GoogleFonts.ibmPlexSans(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 10 / text.length,
          ),
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: true,
          ),
        );

  static String _rotate(String text) {
    String result = '';
    for (int i = 0; i < text.length - 1; i++) {
      result += '${text[i]}\n';
    }
    return result + text[text.length - 1];
  }
}
