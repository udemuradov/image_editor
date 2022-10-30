import 'dart:ui';

abstract class AppColors {
  static const appMenu = Color(0xFF09184D);
  static const appButtons = Color(0xFF7858F2);
  static const appTitle = Color(0xFF2F2E2E);
  static const appText = Color(0xFF808085);
  static const appBg = Color(0xFFEDF2FA);
}

/// Find all examples here: https://api.flutter.dev/flutter/dart-ui/ColorFilter/ColorFilter.matrix.html
List<ColorFilter> colorFilter = [
  const ColorFilter.matrix(<double>[
    /// matrix
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0
  ]),
  const ColorFilter.matrix(<double>[
    /// matrix
    0.393, 0.769, 0.189, 0, 0,
    0.349, 0.686, 0.168, 0, 0,
    0.272, 0.534, 0.131, 0, 0,
    0, 0, 0, 1, 0,
  ]),
  const ColorFilter.matrix(<double>[
    /// matrix
    -1, 0, 0, 0, 255,
    0, -1, 0, 0, 255,
    0, 0, -1, 0, 255,
    0, 0, 0, 1, 0,
  ])
];
