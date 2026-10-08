class ImageException implements Exception {
  ImageException(this.message);

  final String message;

  @override
  String toString() => message;
}

String imageErrorMessage(Object error) {
  if (error is ImageException) return error.message;
  return 'Something went wrong. Please try again.';
}
