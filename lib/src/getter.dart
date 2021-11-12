import 'package:recase/recase.dart';

class ClassGetter {
  /// * return type ex : String, int, bool, List<String>
  final String type;

  /// * name of the getter
  final String name;

  /// * the acctual returl of the getter example => 'name'.tr
  /// * dont add a `;` at the end of the return
  final String whatToReturn;

  /// * is the getter static
  final bool isStatic;

  ClassGetter({
    required this.type,
    required this.name,
    required this.whatToReturn,
    this.isStatic = false,
  });
  bool get isPrivate => name.startsWith('_');
  @override
  String toString() {
    return "${isStatic ? 'static ' : ''}$type get ${isPrivate ? '_' : ''}${name.camelCase} => $whatToReturn ;";
  }
}
