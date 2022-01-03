import 'class_builder.dart';
import 'package:df_builder/extensions/list_of_string.dart';

/// * handlers creation of dart files
class DartFileBuilder {
  /// * file parts
  final List<String> _parts;

  /// * file imports
  final List<String> _imports;

  /// * file exports
  final List<String> _exports;

  /// * file top comments
  final List<String> _topComments;

  /// * file classes
  final List<ClassBuilder> _classes = [];
  List<ClassBuilder> get classes => _classes;

  DartFileBuilder({
    List<String> parts = const [],
    List<String> imports = const [],
    List<String> exports = const [],
    List<String> topComments = const [],
  })  : _topComments = topComments,
        _imports = imports,
        _exports = exports,
        _parts = imports;

  @override
  String toString() {
    /// merge the parts to a single string
    /// adds space between each part
    return [
      /// * file imports
      _imports.merge(),

      /// * file exports
      _exports.merge(),

      /// * file parts
      _parts.merge(),

      /// * file top comments
      _topComments.merge(),

      /// * file classes
      _classes.map((e) => e.toString()).merge(),
    ].merge();
  }

  /// add a class to the file
  /// if a class already exists with the same name it will be ignored
  void addClass(ClassBuilder builder) {
    if (_classes.where((e) => e.name == builder.name).isNotEmpty) {
      throw Exception('[DFB] class ${builder.name} already exists');
    }
    _classes.add(builder);
  }
}
