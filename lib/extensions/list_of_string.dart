extension StringListX on Iterable<String> {
  /// * Add lines between each item and convert it string
  /// Returns a string with all elements separated by [new line].
  String merge() => join('\n');
}
