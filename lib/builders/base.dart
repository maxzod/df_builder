import 'package:equatable/equatable.dart';

abstract class BaseBuilder extends Equatable {
  final String name;

  BaseBuilder({
    required this.name,
  });

  ///* return true based on the name if starts with `_`
  bool get isPrivate => name.startsWith('_');
}
