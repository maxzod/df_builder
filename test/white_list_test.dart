import 'package:df_builder/whitelist.dart';
import 'package:test/test.dart';

void main() {
  test('it throw if start with a number', () {
    expect(
      () => validateName('1foo'),
      throwsA(isA<NameError>()),
    );
  });
  test('it does not throw if start with chars but contains a number', () {
    bool throws = false;
    try {
      validateName('a1foo');
    } on NameError {
      throws = true;
    }
    expect(throws, isFalse);
  });
}
