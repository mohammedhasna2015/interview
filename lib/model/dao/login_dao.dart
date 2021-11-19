class LoginDao {
  LoginDao({
      String? messageWebengage, 
      String? message,}){
    _messageWebengage = messageWebengage;
    _message = message;
}

  LoginDao.fromJson(dynamic json) {
    _messageWebengage = json['message_webengage'];
    _message = json['message'];
  }
  String? _messageWebengage;
  String? _message;

  String? get messageWebengage => _messageWebengage;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message_webengage'] = _messageWebengage;
    map['message'] = _message;
    return map;
  }

}