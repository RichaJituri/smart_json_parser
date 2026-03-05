import 'parser/bool_parser.dart';
import 'parser/double_parser.dart';
import 'parser/int_parser.dart';
import 'parser/string_parser.dart';

/// Public entry point for safe JSON parsing.
///
/// `SmartJson` exposes static helpers for converting dynamic values from JSON
/// into strongly typed Dart values. The helpers never throw; instead they
/// return a sensible default when parsing fails, making them ideal for
/// working with inconsistent or loosely typed API responses.
class SmartJson {
  const SmartJson._();

  /// Safely parses [value] into an [int].
  ///
  /// Accepts `int`, `double`, and numeric `String` values. If [value] is
  /// `null` or cannot be converted, [defaultValue] is returned.
  static int intValue(
    dynamic value, {
    int defaultValue = 0,
  }) {
    return parseInt(value, defaultValue);
  }

  /// Safely parses [value] into a [double].
  ///
  /// Accepts `double`, `int`, and numeric `String` values. If [value] is
  /// `null` or cannot be converted, [defaultValue] is returned.
  static double doubleValue(
    dynamic value, {
    double defaultValue = 0.0,
  }) {
    return parseDouble(value, defaultValue);
  }

  /// Safely parses [value] into a [bool].
  ///
  /// Accepts `bool`, numeric values (`1` / `0`), and common string
  /// representations such as `"true"`, `"false"`, `"yes"`, `"no"`, `"1"`,
  /// and `"0"`. If [value] is `null` or cannot be mapped, [defaultValue]
  /// is returned.
  static bool boolValue(
    dynamic value, {
    bool defaultValue = false,
  }) {
    return parseBool(value, defaultValue);
  }

  /// Safely parses [value] into a [String].
  ///
  /// Returns the input string as-is. For numbers, booleans, and other
  /// types, `toString()` is used. If [value] is `null`, [defaultValue] is
  /// returned.
  static String stringValue(
    dynamic value, {
    String defaultValue = '',
  }) {
    return parseString(value, defaultValue);
  }
}
