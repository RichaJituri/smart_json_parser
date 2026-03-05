/// Safely parses [value] into an [int].
///
/// Accepted inputs:
/// - `null` → [defaultValue]
/// - `int` → returned as-is
/// - `double` → truncated using `toInt()`
/// - `String` → parsed with `int.tryParse`; on failure, [defaultValue]
int parseInt(dynamic value, int defaultValue) {
  if (value == null) {
    return defaultValue;
  }

  if (value is int) {
    return value;
  }

  if (value is double) {
    return value.toInt();
  }

  if (value is String) {
    final trimmed = value.trim();
    final parsed = int.tryParse(trimmed);
    if (parsed != null) {
      return parsed;
    }
  }

  return defaultValue;
}
