class ResponseData {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;
  final String errorMessage;

  ResponseData({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
    this.errorMessage = 'Something went wrong!',
  });
}
