import 'package:df_builder/builders/function_builder.dart';
import 'package:df_builder/df_builder.dart';
import 'package:recase/recase.dart';

/// * creates new dart class
class ClassBuilder extends BaseBuilder {
  /// * top comments
  final List<String> topComments;

  /// * should use private constructor
  final bool havePrivateConstructor;

  /// * class properties
  final List<ClassProp> classProps;

  /// * class getters
  final List<ClassGetter> getters;

  /// * class functions
  final List<FunctionBuilder> functions;

  ClassBuilder({
    required String name,
    this.classProps = const [],
    this.topComments = const [],
    this.getters = const [],
    this.functions = const [],
    this.havePrivateConstructor = false,
  }) : super(name: name);

  @override
  String toString() {
    final buffer = StringBuffer(topCommentsBuilder());
    final gettersBuffer = StringBuffer()..writeAll(getters);
    final functionsBuffer = StringBuffer()..writeAll(functions);
    buffer.write(
        'class ${isPrivate ? '_' : ''}${name.pascalCase}{${isPrivate ? '_' : ''}${name.pascalCase}${havePrivateConstructor ? '._' : ''}(${constructorProps()});${classPropsBuilder()}$gettersBuffer$functionsBuffer}');

    return buffer.toString();
  }

  String classPropsBuilder() {
    final _buffer = StringBuffer();
    classProps.forEach(_buffer.writeln);
    return _buffer.toString();
  }

  String topCommentsBuilder() {
    final _buffer = StringBuffer();
    topComments.forEach(_buffer.writeln);
    return _buffer.toString();
  }

  String constructorProps() {
    final buf = StringBuffer();
    buf.writeAll(classProps
        .where((e) => e.addToConstructor)
        .toList()
        .map((e) => 'this.' + e.name + ',')
        .toList());
    return buf.toString().trim();
  }

  @override
  List<Object?> get props => [
        name,
        topComments,
        classProps,
      ];
}
