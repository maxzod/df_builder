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

  DartFileBuilder({
    required this.name,
    required this.path,
    this.imports = const [],
    this.topComments = const [],
  });

  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.writeAll(_classes);
    final _imports = StringBuffer()
      ..writeAll(imports)
      ..toString();
    final _topComments = StringBuffer()
      ..writeAll(topComments)
      ..toString();
    return '$_topComments\n\n$_imports\n\n$buffer';
  }

  /// add a class to the file
  /// if a class already exists with the same name it will be ignored
  void addClass(ClassBuilder builder) {
    if (_classes.where((e) => e.name == builder.name).isNotEmpty) return;
    _classes.add(builder);
  }
}
  //  final genFile = File('./bin/gen/ar.dart');
  //   if (await genFile.exists()) await genFile.delete();
  //   await genFile.writeAsString(dfBulder.toString());