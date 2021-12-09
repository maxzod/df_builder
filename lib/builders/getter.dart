import 'package:recase/recase.dart';

class ClassGetter {
  /// * return type ex : String, int, bool, List<String>
  final String type;

  /// * name of the getter
  final String name;

  /// * the actual return of the getter example => 'name'.tr
  /// * don't add a `;` at the end of the return
  final String whatToReturn;

  /// * is the getter static
  final bool isStatic;

  /// * comments in top of the getter
  final List<String> comments;

  /// * if the getter is deprecated
  /// * provide a message to explain the deprecation
  /// * will annotate the getter with `@deprecated`
  final String? deprecatedMessage;

  ClassGetter({
    required this.type,
    required this.name,
    required this.whatToReturn,
    this.comments = const [],
    this.deprecatedMessage,
    this.isStatic = false,
  });

  bool get isDeprecated => deprecatedMessage != null;
  bool get isPrivate => name.startsWith('_');
  @override
  String toString() {
    return "${comments.isEmpty ? '' : '\n$comments\n'}${isDeprecated ? '@Deprecated(\'$deprecatedMessage\')\n' : ''}${isStatic ? 'static ' : ''}$type get ${isPrivate ? '_' : ''}${name.camelCase} => $whatToReturn ;";
  }
}
