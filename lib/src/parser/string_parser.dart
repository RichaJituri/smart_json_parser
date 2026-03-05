/// Safely parses [value] into a [String].
///
/// Accepted inputs:
/// - `null` → [defaultValue]
/// - `String` → returned as-is
/// - `int`, `double`, `bool`, others → `toString()`
String parseString(dynamic value, String defaultValue) {
  if (value == null) {
    return defaultValue;
  }

  if (value is String) {
    return value;
  }

  return value.toString();
}
