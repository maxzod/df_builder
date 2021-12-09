import 'package:equatable/equatable.dart';
import 'package:recase/recase.dart';

import 'getter.dart';
import 'prop.dart';

/// * creates new dart class
class ClassBuilder extends Equatable {
  /// * class name
  final String name;

  /// * top comments
  final List<String> topComments;

  /// * should use private constructor
  final bool havePrivateConstructor;

  /// * class properties
  final List<ClassProp> classProps;

  /// * class getters
  final List<ClassGetter> getters;

  ClassBuilder({
    required this.name,
    this.classProps = const [],
    this.topComments = const [],
    this.getters = const [],
    this.havePrivateConstructor = false,
  });

  @override
  String toString() {
    final buffer = StringBuffer(topCommentsBuilder());
    final gettersBuffer = StringBuffer()..writeAll(getters);
    buffer.write(
        'class ${isPrivate ? '_' : ''}${name.pascalCase}{${isPrivate ? '_' : ''}${name.pascalCase}${havePrivateConstructor ? '._' : ''}(${constructorProps()});${classPropsBuilder()}$gettersBuffer}');

    return buffer.toString();
  }

  ///* return true based on the class name if starts with `_`
  bool get isPrivate => name.startsWith('_');

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
