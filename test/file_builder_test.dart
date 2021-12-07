import 'package:df_builder/src/class_builder.dart';
import 'package:df_builder/src/file_builder.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

void main() {
  test('it add class if does not exist before', () {
    final fBuilder = DartFileBuilder();
    expect(fBuilder.classes.length, 0);
    final classBuilder = ClassBuilder(name: 'name');
    fBuilder.addClass(classBuilder);
    expect(fBuilder.classes.length, 1);
  });
  test('it does not add class if already added with the same name before', () {
    final fBuilder = DartFileBuilder();
    expect(fBuilder.classes.length, 0);
    final classBuilder = ClassBuilder(name: 'name');
    fBuilder.addClass(classBuilder);
    expect(fBuilder.classes.length, 1);
    fBuilder.addClass(classBuilder);
    expect(fBuilder.classes.length, 1);
  });
}
