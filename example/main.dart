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
