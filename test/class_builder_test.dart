import 'package:df_builder/src/class_builder.dart';
import 'package:df_builder/src/prop.dart';
import 'package:test/test.dart';

void main() {
  test('it build the private getter correctly', () {
    final cClass = ClassBuilder(name: '_foo');
    expect(cClass.isPrivate, isTrue);
    final cClass2 = ClassBuilder(name: 'foo');
    expect(cClass2.isPrivate, isFalse);
  });

  group(
    'constractourProps',
    () {
      test('it return empty if no props', () {
        final cClass = ClassBuilder(name: 'foo');
        expect(cClass.constractourProps(), '');
      });
      test('it return props if exists', () {
        final cClass = ClassBuilder(
          name: 'foo',
          classProps: [
            ClassProp(type: 'String', name: 'foo', isfinal: true),
            ClassProp(type: 'String', name: 'bar', isfinal: true),
          ],
        );
        expect(cClass.constractourProps(), 'this.foo,this.bar,');
      });
    },
  );

  group('topCommentsBuilder', () {
    test('it return empty if none added', () {
      final cClass = ClassBuilder(name: 'foo');
      expect(cClass.topCommentsBuilder(), '');
    });
    test('it return class props if added', () {
      final cClass = ClassBuilder(
        name: 'foo',
        topComments: [
          '/// this is a comment',
          '/// this is a comment 2',
        ],
      );
      expect(cClass.topCommentsBuilder(),
          '/// this is a comment\n/// this is a comment 2\n');
    });
  });
  group('classPropsBuilder', () {
    test('it return empty if none added', () {
      final cClass = ClassBuilder(name: 'foo');
      expect(cClass.classPropsBuilder(), '');
    });
    test('it return class props if added', () {
      final cClass = ClassBuilder(
        name: 'foo',
        classProps: [
          ClassProp(type: 'String', name: 'foo', isfinal: true),
          ClassProp(type: 'String', name: 'bar', isfinal: true),
        ],
      );
      expect(cClass.classPropsBuilder(),
          'final String foo ;\nfinal String bar ;\n');
    });
  });

  group('ClassBuilder toString', () {
    test('', () {
      final cClass = ClassBuilder(
        name: 'foo',
        topComments: [
          '/// this is a comment',
          '/// this is a comment 2',
        ],
        classProps: [
          ClassProp(type: 'String', name: 'foo', isfinal: true),
          ClassProp(type: 'String', name: 'bar', isfinal: true),
        ],
      );
      expect(cClass.toString(),
          '/// this is a comment\n/// this is a comment 2\nclass Foo{Foo(this.foo,this.bar,);final String foo ;\nfinal String bar ;\n}');
    });
  });
}
