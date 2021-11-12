import 'package:df_builder/src/getter.dart';
import 'package:test/test.dart';

void main() {
  test('isPrivate return True if starts with _', () {
    final getter = ClassGetter(type: '', name: '_foo', whatToReturn: 'foo;');
    expect(getter.isPrivate, isTrue);
    final gettr2 = ClassGetter(type: '', name: 'foo', whatToReturn: 'foo;');
    expect(gettr2.isPrivate, isFalse);
  });

  test('it build the getter without static correctly', () {
    final prop = ClassGetter(type: 'String', name: 'foo', whatToReturn: 'bar');
    expect(prop.toString(), 'String get foo => bar ;');
  });
  test('it build the static getter correctly', () {
    final prop = ClassGetter(
        type: 'String', name: 'foo', isStatic: true, whatToReturn: 'bar');
    expect(prop.toString(), 'static String get foo => bar ;');
  });
  test('it build the private getter correctly', () {
    final prop = ClassGetter(
        type: 'String', name: '_foo', isStatic: true, whatToReturn: 'bar');
    expect(prop.toString(), 'static String get _foo => bar ;');
  });
}
