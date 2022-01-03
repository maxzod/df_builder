import 'package:df_builder/builders/function_builder.dart';
import 'package:test/test.dart';

void main() {
  test('it build function correctly', () {
    final b1 = FunctionBuilder(
      name: 'test',
      returnType: 'String',
      body: 'return "test";',
    );

    expect(b1.toString(), 'String test(){return "test";}');
  });
  test('it build static functions correctly', () {
    final b1 = FunctionBuilder(
      name: 'test',
      returnType: 'String',
      body: 'return "test";',
      isStatic: true,
    );

    expect(b1.toString(), 'static String test(){return "test";}');
  });
  test('it build async functions correctly', () {
    final b1 = FunctionBuilder(
        name: 'test',
        returnType: 'String',
        body: 'return "test";',
        isStatic: true,
        isAsync: true);

    expect(b1.toString(), 'static String test() async {return "test";}');
  });
  test('== operator', () {
    final b1 = FunctionBuilder(
      name: 'test',
      returnType: 'String',
      body: 'return "test";',
    );
    final b2 = FunctionBuilder(
      name: 'test',
      returnType: 'String',
      body: 'return "test";',
    );
    expect(b1, equals(b2));
  });
}
