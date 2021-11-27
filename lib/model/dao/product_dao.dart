class ProductDao {
  ProductDao({
      int? status, 
      String? message, 
      int? totalRecord, 
      int? totalPage, 
      List<ProductItem>? data,}){
    _status = status;
    _message = message;
    _totalRecord = totalRecord;
    _totalPage = totalPage;
    _data = data;
}

  ProductDao.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _totalRecord = json['totalRecord'];
    _totalPage = json['totalPage'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(new ProductItem.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  int? _totalRecord;
  int? _totalPage;
  List<ProductItem>? _data;

  int? get status => _status;
  String? get message => _message;
  int? get totalRecord => _totalRecord;
  int? get totalPage => _totalPage;
  List<ProductItem>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['totalRecord'] = _totalRecord;
    map['totalPage'] = _totalPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductItem {
  ProductItem({
      int? id, 
      String? slug, 
      String? title, 
      String? description, 
      int? price, 
      String? featuredImage, 
      String? status, 
      String? createdAt,}){
    _id = id;
    _slug = slug;
    _title = title;
    _description = description;
    _price = price;
    _featuredImage = featuredImage;
    _status = status;
    _createdAt = createdAt;
}

  ProductItem.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _featuredImage = json['featured_image'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _slug;
  String? _title;
  String? _description;
  int? _price;
  String? _featuredImage;
  String? _status;
  String? _createdAt;

  int? get id => _id;
  String? get slug => _slug;
  String? get title => _title;
  String? get description => _description;
  int? get price => _price;
  String? get featuredImage => _featuredImage;
  String? get status => _status;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['featured_image'] = _featuredImage;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}