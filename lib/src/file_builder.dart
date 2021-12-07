import 'class_builder.dart';

class DartFileBuilder {
  /// * file parts
  final List<String> parts;

  /// * file imports
  final List<String> imports;

  /// * file exports
  final List<String> exports;

  /// * file top comments
  final List<String> topComments;

  /// * file classes
  final List<ClassBuilder> _classes = [];
  List<ClassBuilder> get classes => _classes;

  DartFileBuilder({
    this.parts = const [],
    this.imports = const [],
    this.exports = const [],
    this.topComments = const [],
  });

  @override
  String toString() {
    final _imports = StringBuffer()
      ..writeAll(imports)
      ..toString();
    final _exports = StringBuffer()
      ..writeAll(exports)
      ..toString();
    final _parts = StringBuffer()
      ..writeAll(parts)
      ..toString();
    final _topComments = StringBuffer()
      ..writeAll(topComments)
      ..toString();
    final classes = StringBuffer()
      ..writeAll(_classes)
      ..toString();

    final fileBuffer = StringBuffer()
      ..write(_imports)
      ..write('\n')
      ..write(_exports)
      ..write('\n')
      ..write(_parts)
      ..write('\n')
      ..write(_topComments)
      ..write('\n')
      ..write(classes);
    return fileBuffer.toString();
  }

  /// add a class to the file
  /// if a class already exists with the same name it will be ignored
  void addClass(ClassBuilder builder) {
    if (_classes.where((e) => e.name == builder.name).isNotEmpty) return;
    _classes.add(builder);
  }
}
