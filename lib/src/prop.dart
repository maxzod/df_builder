import 'package:equatable/equatable.dart';

class ClassProp extends Equatable {
  final String type;
  final bool? _addToConstructor;
  final String name;
  final bool isStatic;
  final bool isfinal;

  ClassProp({
    required this.type,
    bool? addToConstructor,
    required this.name,
    this.isStatic = false,
    this.isfinal = false,
  }) : _addToConstructor = addToConstructor;

  bool get addToConstructor => isStatic ? false : _addToConstructor ?? isfinal;
  @override
  String toString() {
    return '${isStatic ? 'static ' : ''}${isfinal ? 'final ' : ''}$type $name ;';
  }

  @override
  List<Object?> get props => [
        type,
        name,
        isStatic,
        isfinal,
      ];
}
