/// Safely parses [value] into a [double].
///
/// Accepted inputs:
/// - `null` → [defaultValue]
/// - `double` → returned as-is
/// - `int` → converted with `.toDouble()`
/// - `String` → parsed with `double.tryParse`; on failure, [defaultValue]
double parseDouble(dynamic value, double defaultValue) {
  if (value == null) {
    return defaultValue;
  }

  if (value is double) {
    return value;
  }

  if (value is int) {
    return value.toDouble();
  }

  if (value is String) {
    final trimmed = value.trim();
    final parsed = double.tryParse(trimmed);
    if (parsed != null) {
      return parsed;
    }
  }

  return defaultValue;
}
