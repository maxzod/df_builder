import 'class_builder.dart';

class DartFileBuilder {
  /// * file name
  final String name;

  /// * path to save to
  final String path;

  /// * file imports
  final List<String> imports;

  /// * file top comments
  final List<String> topComments;

  /// * file classes
  final List<ClassBuilder> _classes = [];
  List<ClassBuilder> get classes => _classes;

  DartFileBuilder({
    required this.name,
    required this.path,
    this.imports = const [],
    this.topComments = const [],
  });

  @override
  String toString() {
    final _imports = StringBuffer()
      ..writeAll(imports)
      ..toString();
    final _topComments = StringBuffer()
      ..writeAll(topComments)
      ..toString();
    final buffer = StringBuffer();
    buffer.writeAll(_classes);
    return '$_topComments\n\n$_imports\n\n$buffer';
  }

  /// add a class to the file
  /// if a class already exists with the same name it will be ignored
  void addClass(ClassBuilder builder) {
    if (_classes.where((e) => e.name == builder.name).isNotEmpty) return;
    _classes.add(builder);
  }
}
