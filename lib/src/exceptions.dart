class MissingParameterException implements Exception {
  final message;

  MissingParameterException(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MissingParameterException &&
              runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  String toString() => "Exception: $message";
}

class InvalidTokenException implements Exception {
  final message;

  InvalidTokenException(this.message);

  @override
  String toString() => "Exception: $message";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is InvalidTokenException && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class NoMatchingResultsException implements Exception {
  final message;

  NoMatchingResultsException(this.message);

  @override
  String toString() => "Exception: $message";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is NoMatchingResultsException &&
              runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
