class MissingParameterException implements Exception {
  final message;

  MissingParameterException(this.message);

  @override
  String toString() => "Exception: $message";
}
