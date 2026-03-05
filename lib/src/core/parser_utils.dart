/// Ensures that a nullable JSON map is converted into a non-null,
/// mutable `Map<String, dynamic>`.
Map<String, dynamic> normalizeJson(Map<String, dynamic>? source) {
  if (source == null) {
    return <String, dynamic>{};
  }
  // Create a copy so that external mutation does not affect this wrapper.
  return Map<String, dynamic>.from(source);
}

/// Normalizes a dynamic JSON value into something easier to parse.
Object? normalizeValue(Object? value) {
  if (value is num || value is bool || value is String) {
    return value;
  }
  // Many backends encode numbers/bools as strings.
  if (value is Enum) {
    return value.name;
  }
  return value?.toString();
}
