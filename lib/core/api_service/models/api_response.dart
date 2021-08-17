class ApiResponse<T> {
  const ApiResponse(this.success, this.body, this.message);
  const ApiResponse.success(this.body, {String? message})
      : this.success = true,
        this.message = message ?? '';
  const ApiResponse.error(this.message, {T? body})
      : this.success = false,
        this.body = body;

  final bool success;
  final T? body;
  final String message;

  @override
  String toString() =>
      'ApiResponse(success: $success, body: $body, message: $message)';
}
