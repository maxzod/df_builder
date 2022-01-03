import 'package:df_builder/df_builder.dart';

class ParamBuilder extends BaseBuilder {
  final String type;
  final bool isRequired;

  ParamBuilder({
    required String name,
    required this.type,
    this.isRequired = false,
  }) : super(name: name);

  @override
  String toString() => '${isRequired ? 'required ' : ''}$type $name';

  @override
  List<Object?> get props => [
        name,
        type,
        isRequired,
      ];
}
