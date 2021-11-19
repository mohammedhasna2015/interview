class ResponseModel {
  dynamic data;
  dynamic errorMessage;
  bool isSuccess;

  ResponseModel({this.data, this.errorMessage, this.isSuccess = true});
}
