import 'package:df_builder/df_builder.dart';

/// * handlers creation of dart files
class FunctionBuilder extends BaseBuilder {
  final String returnType;
  final String body;
  final bool isStatic;
  final bool isAsync;
  final List<ParamBuilder> params;
  FunctionBuilder({
    required String name,
    required this.body,
    this.returnType = '',
    this.isStatic = false,
    this.isAsync = false,
    this.params = const <ParamBuilder>[],
  }) : super(name: name);

  @override
  String toString() =>
      '${isStatic ? 'static ' : ''}$returnType $name(${params.isEmpty ? '' : params.join(', ')})${isAsync ? ' async ' : ''}{$body}';

  @override
  List<Object> get props {
    return [
      returnType,
      name,
      body,
      isStatic,
      isAsync,
    ];
  }
}
