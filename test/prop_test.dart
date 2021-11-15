import 'package:df_builder/src/prop.dart';
import 'package:test/test.dart';

void main() {
  test('addToConstructor return True if is final', () {
    final prop = ClassProp(type: '', name: '', isFinal: true);
    expect(prop.addToConstructor, isTrue);
  });
  test('addToConstructor return True if is equals to true', () {
    final prop = ClassProp(type: '', name: '', addToConstructor: true);
    expect(prop.addToConstructor, isTrue);
  });
  test('addToConstructor return False if is isStatic = True', () {
    final prop = ClassProp(type: '', name: '', isStatic: true, isFinal: true);
    expect(prop.addToConstructor, isFalse);
  });
  test('it build the static fields correctly', () {
    final prop = ClassProp(type: 'String', name: 'foo', isStatic: true);
    expect(prop.toString(), 'static String foo ;');
  });
  test('it build the static final fields correctly', () {
    final prop =
        ClassProp(type: 'String', name: 'foo', isStatic: true, isFinal: true);
    expect(prop.toString(), 'static final String foo ;');
  });
  test('it build the final fields correctly', () {
    final prop = ClassProp(type: 'String', name: 'foo', isFinal: true);
    expect(prop.toString(), 'final String foo ;');
  });
  test('it build the fields correctly', () {
    final prop = ClassProp(type: 'String', name: 'foo');
    expect(prop.toString(), 'String foo ;');
  });
}
