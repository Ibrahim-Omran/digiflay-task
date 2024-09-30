class ErrorModel{
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      status: jsonData['statusCode'],
      errorMessage: jsonData['message'],
    );
  }
}
// {"message":"Unauthorized","statusCode":401}