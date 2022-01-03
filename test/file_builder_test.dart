import 'package:df_builder/df_builder.dart';
import 'package:test/test.dart';

void main() {
  test('it add class if does not exist before', () {
    final fBuilder = DartFileBuilder();
    expect(fBuilder.classes.length, 0);
    final classBuilder = ClassBuilder(name: 'name');
    fBuilder.addClass(classBuilder);
    expect(fBuilder.classes.length, 1);
  });
  test('it throws when add class if already added with the same name before',
      () {
    final fBuilder = DartFileBuilder();
    expect(fBuilder.classes.length, 0);
    final classBuilder = ClassBuilder(name: 'name');
    fBuilder.addClass(classBuilder);

    expect(
      () => fBuilder.addClass(classBuilder),
      throwsA(isA<Exception>()),
    );
  });
  test('it throws when add class if already added with the same name before',
      () {
    final fBuilder = DartFileBuilder();
    expect(fBuilder.classes.length, 0);
    final classBuilder = ClassBuilder(name: 'name');
    fBuilder.addClass(classBuilder);

    expect(
      () => fBuilder.addClass(classBuilder),
      throwsA(isA<Exception>()),
    );
  });
  test('it builds the dart file correctly', () {
    final fBuilder = DartFileBuilder();
    fBuilder.addClass(ClassBuilder(
      name: 'name',
      classProps: [
        ClassProp(
          isFinal: true,
          addToConstructor: true,
          name: 'prop',
          type: 'String',
        ),
      ],
    ));
    expect(fBuilder.toString(),
        '\n\n\n\nclass Name{Name(this.prop,);final String prop ;\n}');
  });
}
