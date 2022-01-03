import 'package:df_builder/whitelist.dart';
import 'package:test/test.dart';

void main() {
  test('name error contains the field name', () {
    expect(NameError('foo').toString(), contains('foo'));
  });
}
