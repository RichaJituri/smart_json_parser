/// Safely parses [value] into a [bool].
///
/// Accepted inputs:
/// - `true` / `false` → returned as-is
/// - `1` / `0` → `true` / `false`
/// - `"true"`, `"yes"`, `"1"` → `true`
/// - `"false"`, `"no"`, `"0"` → `false`
/// - `null` or any other value → [defaultValue]
bool parseBool(dynamic value, bool defaultValue) {
  if (value == null) {
    return defaultValue;
  }

  if (value is bool) {
    return value;
  }

  if (value is num) {
    if (value == 1) return true;
    if (value == 0) return false;
  }

  if (value is String) {
    final lower = value.trim().toLowerCase();
    if (lower == 'true' || lower == 'yes' || lower == '1') {
      return true;
    }
    if (lower == 'false' || lower == 'no' || lower == '0') {
      return false;
    }
  }

  return defaultValue;
}
