class NameError implements Exception {
  final String name;
  NameError(this.name);
  @override
  String toString() => "NameError: $name is not valid name";
}

void validateName(String name) {
  const pattern = r'^[a-zA-Z_\$][a-zA-Z0-9_\$]*$';
  if (!RegExp(pattern).hasMatch(name)) {
    throw NameError(name);
  }
}
