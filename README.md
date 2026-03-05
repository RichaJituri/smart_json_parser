# smart_json_parser

`smart_json_parser` is a lightweight helper for safely reading values from dynamic JSON in Dart and Flutter apps, avoiding runtime crashes from inconsistent API responses.

---

## Features

- Safe JSON parsing
- Handles null values
- Supports `int`, `double`, `bool`, and `String`
- Lightweight and dependency-free
- Works with Flutter and pure Dart

---

## Installation

Add `smart_json_parser` to your `pubspec.yaml`:

```yaml
dependencies:
  smart_json_parser: ^1.0.2
```

Then run:

```bash
dart pub get
```

For Flutter:

```bash
flutter pub get
```

---

## Usage Example

Import the package:

```dart
import 'package:smart_json_parser/smart_json_parser.dart';
```

Parse JSON values safely:

```dart
final json = {
  'id': '10',
  'price': '45.5',
  'isActive': 'true',
};

final id = SmartJson.intValue(json['id']);
final price = SmartJson.doubleValue(json['price']);
final isActive = SmartJson.boolValue(json['isActive']);
final name = SmartJson.stringValue(json['name']); // falls back to default ""
```

---

## Supported Types

`SmartJson` currently supports:

- `int` via `SmartJson.intValue(...)`
- `double` via `SmartJson.doubleValue(...)`
- `bool` via `SmartJson.boolValue(...)`
- `String` via `SmartJson.stringValue(...)`

Each helper accepts a `defaultValue` parameter that is returned when parsing fails.

---

## Why smart_json_parser?

Many real‑world APIs return values in unexpected formats, for example:

```json
{
  "age": "25",
  "price": "12.5",
  "active": "true"
}
```

`age` should be an `int`, `price` a `double`, and `active` a `bool`, but everything comes back as `String`.  
`smart_json_parser` lets you safely convert these values to the types you expect, with sensible defaults instead of runtime exceptions.

---

## Example JSON Parsing

See the runnable example in `example/main.dart`:

```dart
import 'package:smart_json_parser/smart_json_parser.dart';

void main() {
  final json = <String, dynamic>{
    'age': '30',
    'salary': '55000.75',
    'verified': 'true',
    'name': 'Richa',
  };

  final age = SmartJson.intValue(json['age']);
  final salary = SmartJson.doubleValue(json['salary']);
  final verified = SmartJson.boolValue(json['verified']);
  final name = SmartJson.stringValue(json['name']);

  print('Age: $age');
  print('Salary: $salary');
  print('Verified: $verified');
  print('Name: $name');
}
```

Run it from the package root:

```bash
dart run example/main.dart
```

---

## License

This project is licensed under the **MIT License**.  
See the `LICENSE` file for details.

