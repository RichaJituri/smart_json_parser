import 'package:smart_json_parser/smart_json_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SmartJson', () {
    test('parses basic types safely', () {
      final json = {
        'age': '21',
        'height': 1.75,
        'active': 'true',
        'name': 'Alice',
      };

      expect(SmartJson.intValue(json['age']), 21);
      expect(SmartJson.doubleValue(json['height']), 1.75);
      expect(SmartJson.boolValue(json['active']), isTrue);
      expect(SmartJson.stringValue(json['name']), 'Alice');
    });

    test('returns defaults for invalid values', () {
      final json = {
        'age': 'not-a-number',
        'active': 'maybe',
      };

      expect(SmartJson.intValue(json['age']), 0);
      expect(SmartJson.boolValue(json['active']), isFalse);
    });
  });
}
