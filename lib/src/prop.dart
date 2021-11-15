import 'package:equatable/equatable.dart';

class ClassProp extends Equatable {
  final String type;
  final bool? _addToConstructor;
  final String name;
  final bool isStatic;
  final bool isFinal;

  ClassProp({
    required this.type,
    bool? addToConstructor,
    required this.name,
    this.isStatic = false,
    this.isFinal = false,
  }) : _addToConstructor = addToConstructor;

  bool get addToConstructor => isStatic ? false : _addToConstructor ?? isFinal;
  @override
  String toString() {
    return '${isStatic ? 'static ' : ''}${isFinal ? 'final ' : ''}$type $name ;';
  }

  @override
  List<Object?> get props => [
        type,
        name,
        isStatic,
        isFinal,
      ];
}
