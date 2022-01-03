import 'package:df_builder/df_builder.dart';
import 'package:test/test.dart';

void main() {
  test('it builds correctly', () {
    final prop = ParamBuilder(name: 'foo', type: 'String');
    expect(prop.toString(), equals('String foo'));
    final prop2 = ParamBuilder(name: 'foo', type: 'String', isRequired: true);
    expect(prop2.toString(), equals('required String foo'));
  });
  test('== operator builds correctly', () {
    final prop = ParamBuilder(name: 'foo', type: 'String', isRequired: true);
    final prop2 = ParamBuilder(name: 'foo', type: 'String', isRequired: true);
    expect(prop, equals(prop2));
  });
}
