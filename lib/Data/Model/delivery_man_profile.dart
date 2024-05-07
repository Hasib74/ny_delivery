/// response : {"delivery_men_id":7,"full_name":"test","email":"akon@gmail.com","phone":"017555544880","is_active":1,"created_at":"2022-08-10T18:18:29.000000Z","updated_at":"2022-08-10T18:18:29.000000Z"}

class DeliveryManProfile {
  DeliveryManProfile({
      Response? response,}){
    _response = response;
}

  DeliveryManProfile.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
DeliveryManProfile copyWith({  Response? response,
}) => DeliveryManProfile(  response: response ?? _response,
);
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response!.toJson();
    }
    return map;
  }

}

/// delivery_men_id : 7
/// full_name : "test"
/// email : "akon@gmail.com"
/// phone : "017555544880"
/// is_active : 1
/// created_at : "2022-08-10T18:18:29.000000Z"
/// updated_at : "2022-08-10T18:18:29.000000Z"

class Response {
  Response({
      int? deliveryMenId, 
      String? fullName, 
      String? email, 
      String? phone, 
      int? isActive,
    String? image,
     String? userName,
      String? createdAt, 
      String? updatedAt,}){
    _deliveryMenId = deliveryMenId;
    _fullName = fullName;
    _email = email;
    _phone = phone;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userName = userName;
    _image = image;
}

  Response.fromJson(dynamic json) {
    _deliveryMenId = json['delivery_men_id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phone = json['phone'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userName = json['user_name'];
    _image = json["delivery_men_image"];
  }
  int? _deliveryMenId;
  String? _fullName;
  String? _email;
  String? _phone;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;
  String? _userName;
  String? _image;
Response copyWith({  int? deliveryMenId,
  String? fullName,
  String? email,
  String? phone,
  int? isActive,
  String? createdAt,
  String? updatedAt,
}) => Response(  deliveryMenId: deliveryMenId ?? _deliveryMenId,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  phone: phone ?? _phone,
  isActive: isActive ?? _isActive,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get deliveryMenId => _deliveryMenId;
  String? get fullName => _fullName;
  String? get userName => _userName;
  String? get email => _email;
  String? get phone => _phone;
  int? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivery_men_id'] = _deliveryMenId;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}