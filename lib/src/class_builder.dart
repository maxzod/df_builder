import 'package:equatable/equatable.dart';
import 'package:recase/recase.dart';

import 'getter.dart';
import 'prop.dart';

class ClassBuilder extends Equatable {
  /// * class name
  final String name;

  /// * top comments
  final List<String> topComments;

  /// * should use private constractour
  final bool havePrivateConstractor;

  /// * class properties
  final List<ClassProp> classProps;

  /// * class getters
  final List<ClassGetter> getters;

  ClassBuilder({
    required this.name,
    this.classProps = const [],
    this.topComments = const [],
    this.getters = const [],
    this.havePrivateConstractor = false,
  });

  @override
  String toString() {
    final buffer = StringBuffer(topCommentsBuilder());
    final gettersbuffer = StringBuffer()..writeAll(getters);
    buffer.write(
        'class ${isPrivate ? '_' : ''}${name.pascalCase}{${isPrivate ? '_' : ''}${name.pascalCase}${havePrivateConstractor ? '._' : ''}(${constractourProps()});${classPropsBuilder()}$gettersbuffer}');

    return buffer.toString();
  }

  ///* return true based on the class name if stratrs with `_`
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

  String constractourProps() {
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
