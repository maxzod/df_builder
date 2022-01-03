import 'package:df_builder/extensions/list_of_string.dart';
import 'package:test/test.dart';

void main() {
  test('it merge the strings together', () {
    expect(['a', 'b', 'c', '', 'd', 'e'].merge(), 'a\nb\nc\n\nd\ne');
  });
}
