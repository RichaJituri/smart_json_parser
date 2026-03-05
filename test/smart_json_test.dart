import 'package:smart_json_parser/smart_json_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SmartJson.intValue', () {
    test('parses integer from string', () {
      expect(SmartJson.intValue('120'), 120);
      expect(SmartJson.intValue(' 120 '), 120);
    });

    test('parses integer from int', () {
      expect(SmartJson.intValue(120), 120);
    });

    test('parses integer from double', () {
      expect(SmartJson.intValue(120.5), 120);
      expect(SmartJson.intValue(120.0), 120);
    });

    test('returns default for null and invalid', () {
      expect(SmartJson.intValue(null), 0);
      expect(SmartJson.intValue('abc', defaultValue: 5), 5);
      expect(SmartJson.intValue(true, defaultValue: 7), 7);
    });
  });

  group('SmartJson.doubleValue', () {
    test('parses double from string', () {
      expect(SmartJson.doubleValue('12.5'), 12.5);
      expect(SmartJson.doubleValue(' 12.5 '), 12.5);
    });

    test('parses double from int', () {
      expect(SmartJson.doubleValue(12), 12.0);
    });

    test('parses double from double', () {
      expect(SmartJson.doubleValue(12.5), 12.5);
    });

    test('returns default for null and invalid', () {
      expect(SmartJson.doubleValue(null), 0.0);
      expect(SmartJson.doubleValue('abc', defaultValue: 3.14), 3.14);
      expect(SmartJson.doubleValue(true, defaultValue: 1.0), 1.0);
    });
  });

  group('SmartJson.boolValue', () {
    test('parses boolean from bool', () {
      expect(SmartJson.boolValue(true), isTrue);
      expect(SmartJson.boolValue(false), isFalse);
    });

    test('parses boolean from canonical strings', () {
      expect(SmartJson.boolValue('true'), isTrue);
      expect(SmartJson.boolValue('false'), isFalse);
      expect(SmartJson.boolValue(' true '), isTrue);
      expect(SmartJson.boolValue(' false '), isFalse);
    });

    test('parses boolean from yes/no strings', () {
      expect(SmartJson.boolValue('yes'), isTrue);
      expect(SmartJson.boolValue('no'), isFalse);
    });

    test('parses boolean from numeric values', () {
      expect(SmartJson.boolValue(1), isTrue);
      expect(SmartJson.boolValue(0), isFalse);
      expect(SmartJson.boolValue(1.0), isTrue);
      expect(SmartJson.boolValue(0.0), isFalse);
    });

    test('returns default for null and invalid', () {
      expect(SmartJson.boolValue(null), isFalse);
      expect(SmartJson.boolValue('maybe', defaultValue: true), isTrue);
      expect(SmartJson.boolValue(2, defaultValue: true), isTrue);
    });
  });

  group('SmartJson.stringValue', () {
    test('returns string as-is', () {
      expect(SmartJson.stringValue('hello'), 'hello');
      expect(SmartJson.stringValue(''), '');
    });

    test('converts numbers and bools to string', () {
      expect(SmartJson.stringValue(120), '120');
      expect(SmartJson.stringValue(12.5), '12.5');
      expect(SmartJson.stringValue(true), 'true');
      expect(SmartJson.stringValue(false), 'false');
    });

    test('returns default for null', () {
      expect(SmartJson.stringValue(null), '');
      expect(SmartJson.stringValue(null, defaultValue: 'n/a'), 'n/a');
    });
  });
}
