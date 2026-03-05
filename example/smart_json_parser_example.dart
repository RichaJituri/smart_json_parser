import 'package:smart_json_parser/smart_json_parser.dart';

void main() {
  final raw = <String, dynamic>{
    'age': '30',
    'height': 1.82,
    'active': 'true',
    'name': 'Richa',
  };

  print('Age: ${SmartJson.intValue(raw['age'])}');
  print('Height: ${SmartJson.doubleValue(raw['height'])}');
  print('Active: ${SmartJson.boolValue(raw['active'])}');
  print('Name: ${SmartJson.stringValue(raw['name'])}');
}
