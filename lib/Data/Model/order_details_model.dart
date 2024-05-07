/// success : "true"
/// status_code : "200"
/// message : {"id":3,"service_provider_id":3,"customer_id":2,"delivery_man_id":2,"order_code":"OR-3","offer_id":1,"order_status_id":40,"total_amount":0,"discount":104,"delivery_fee":0,"paid_amount":0,"payment_type":null,"payment_status":"pending","customer_payment_id":"","order_address":null,"order_datetime":"2022-04-17 17:06:29","delivery_datetime":null,"order_accept_time":"0","delivery_time":"0","items_pick_time":"0","distance":0,"delivery_speed":0,"created_at":"2022-04-17T17:06:29.000000Z","updated_at":"2022-05-09T18:19:19.000000Z","order_details":[{"id":3,"order_id":3,"product_name_id":2,"product_name":null,"amount":229,"quantity":1}],"delivery_man":{"id":2,"delivery_man_ID":"DM-+880-2","full_name":"Hasib","address":"Dhaka","email":"hasib74@gmail.com","phone":"8801731540704","delivery_men_image":"uploads/delivery_men_photos/739036.jpg","delivery_men_ID_card":"uploads/delivery_men_ID_card/1000000.jpg","is_active":1,"gender":null,"country_id":880,"vehicle_type":null,"description":null,"avg_rating":0,"ranking_level":5,"avg_speed":0,"efficiency_rate":0,"no_of_task_done":0,"response_rate":0,"working_area":null,"lat_value":"23.984580","long_value":"89.984580","create_by":9,"joining_date":"1651949885","device_token":"eOdfO2r_T4eebKfNNTHkYc:APA91bFn-lvWlKB9Gfwmlb31wH5lMbKCqB58C8yXmJpHEe5GzgKgRp1ieZCdSlTwAXKjbJ_QCBIk6HDk00Vm27z2jKz80tlzxHlrSz3qsmyt3gwlzB1sWqaKa7xkgrjf8FPHHsh-3S3U"},"customer":{"id":2,"full_name":"Hasib","address":"1 Stockton St,Union Square,San Francisco,Vereinigte Staaten","email":"hasib01@gmail.com","phone":"+8803883848588","photo":null,"gender_id":null,"country_id":880,"description":null,"card_number":"0","device_token":null,"card_cvc":"0","lat_value":"0.000000","long_value":"0.000000","created_at":"2022-04-13T21:05:47.000000Z","updated_at":"2022-04-13T21:05:47.000000Z"}}

class OrderDetailsModel {
  OrderDetailsModel({
      String? success, 
      String? statusCode, 
      Message? message,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
}

  OrderDetailsModel.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['status_code'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  String? _success;
  String? _statusCode;
  Message? _message;
OrderDetailsModel copyWith({  String? success,
  String? statusCode,
  Message? message,
}) => OrderDetailsModel(  success: success ?? _success,
  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
);
  String? get success => _success;
  String? get statusCode => _statusCode;
  Message? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['status_code'] = _statusCode;
    if (_message != null) {
      map['message'] = _message!.toJson();
    }
    return map;
  }

}

/// id : 3
/// service_provider_id : 3
/// customer_id : 2
/// delivery_man_id : 2
/// order_code : "OR-3"
/// offer_id : 1
/// order_status_id : 40
/// total_amount : 0
/// discount : 104
/// delivery_fee : 0
/// paid_amount : 0
/// payment_type : null
/// payment_status : "pending"
/// customer_payment_id : ""
/// order_address : null
/// order_datetime : "2022-04-17 17:06:29"
/// delivery_datetime : null
/// order_accept_time : "0"
/// delivery_time : "0"
/// items_pick_time : "0"
/// distance : 0
/// delivery_speed : 0
/// created_at : "2022-04-17T17:06:29.000000Z"
/// updated_at : "2022-05-09T18:19:19.000000Z"
/// order_details : [{"id":3,"order_id":3,"product_name_id":2,"product_name":null,"amount":229,"quantity":1}]
/// delivery_man : {"id":2,"delivery_man_ID":"DM-+880-2","full_name":"Hasib","address":"Dhaka","email":"hasib74@gmail.com","phone":"8801731540704","delivery_men_image":"uploads/delivery_men_photos/739036.jpg","delivery_men_ID_card":"uploads/delivery_men_ID_card/1000000.jpg","is_active":1,"gender":null,"country_id":880,"vehicle_type":null,"description":null,"avg_rating":0,"ranking_level":5,"avg_speed":0,"efficiency_rate":0,"no_of_task_done":0,"response_rate":0,"working_area":null,"lat_value":"23.984580","long_value":"89.984580","create_by":9,"joining_date":"1651949885","device_token":"eOdfO2r_T4eebKfNNTHkYc:APA91bFn-lvWlKB9Gfwmlb31wH5lMbKCqB58C8yXmJpHEe5GzgKgRp1ieZCdSlTwAXKjbJ_QCBIk6HDk00Vm27z2jKz80tlzxHlrSz3qsmyt3gwlzB1sWqaKa7xkgrjf8FPHHsh-3S3U"}
/// customer : {"id":2,"full_name":"Hasib","address":"1 Stockton St,Union Square,San Francisco,Vereinigte Staaten","email":"hasib01@gmail.com","phone":"+8803883848588","photo":null,"gender_id":null,"country_id":880,"description":null,"card_number":"0","device_token":null,"card_cvc":"0","lat_value":"0.000000","long_value":"0.000000","created_at":"2022-04-13T21:05:47.000000Z","updated_at":"2022-04-13T21:05:47.000000Z"}

class Message {
  Message({
      int? id, 
      int? serviceProviderId, 
      int? customerId, 
      int? deliveryManId, 
      String? orderCode, 
      int? offerId, 
      int? orderStatusId, 
      int? totalAmount, 
      int? discount, 
      int? deliveryFee, 
      int? paidAmount, 
      dynamic paymentType, 
      String? paymentStatus, 
      String? customerPaymentId, 
      dynamic orderAddress, 
      String? orderDatetime, 
      dynamic deliveryDatetime, 
      String? orderAcceptTime, 
      String? deliveryTime, 
      String? itemsPickTime, 
      int? distance, 
      int? deliverySpeed, 
      String? createdAt, 
      String? updatedAt, 
      List<OrderDetails>? orderDetails, 
      DeliveryMan? deliveryMan, 
      Customer? customer,}){
    _id = id;
    _serviceProviderId = serviceProviderId;
    _customerId = customerId;
    _deliveryManId = deliveryManId;
    _orderCode = orderCode;
    _offerId = offerId;
    _orderStatusId = orderStatusId;
    _totalAmount = totalAmount;
    _discount = discount;
    _deliveryFee = deliveryFee;
    _paidAmount = paidAmount;
    _paymentType = paymentType;
    _paymentStatus = paymentStatus;
    _customerPaymentId = customerPaymentId;
    _orderAddress = orderAddress;
    _orderDatetime = orderDatetime;
    _deliveryDatetime = deliveryDatetime;
    _orderAcceptTime = orderAcceptTime;
    _deliveryTime = deliveryTime;
    _itemsPickTime = itemsPickTime;
    _distance = distance;
    _deliverySpeed = deliverySpeed;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderDetails = orderDetails;
    _deliveryMan = deliveryMan;
    _customer = customer;
}

  Message.fromJson(dynamic json) {
    _id = json['id'];
    _serviceProviderId = json['service_provider_id'];
    _customerId = json['customer_id'];
    _deliveryManId = json['delivery_man_id'];
    _orderCode = json['order_code'];
    _offerId = json['offer_id'];
    _orderStatusId = json['order_status_id'];
    _totalAmount = json['total_amount'];
    _discount = json['discount'];
    _deliveryFee = json['delivery_fee'];
    _paidAmount = json['paid_amount'];
    _paymentType = json['payment_type'];
    _paymentStatus = json['payment_status'];
    _customerPaymentId = json['customer_payment_id'];
    _orderAddress = json['order_address'];
    _orderDatetime = json['order_datetime'];
    _deliveryDatetime = json['delivery_datetime'];
    _orderAcceptTime = json['order_accept_time'];
    _deliveryTime = json['delivery_time'];
    _itemsPickTime = json['items_pick_time'];
    _distance = json['distance'];
    _deliverySpeed = json['delivery_speed'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['order_details'] != null) {
      _orderDetails = [];
      json['order_details'].forEach((v) {
        _orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
    _deliveryMan = json['delivery_man'] != null ? DeliveryMan.fromJson(json['delivery_man']) : null;
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  int? _id;
  int? _serviceProviderId;
  int? _customerId;
  int? _deliveryManId;
  String? _orderCode;
  int? _offerId;
  int? _orderStatusId;
  int? _totalAmount;
  int? _discount;
  int? _deliveryFee;
  int? _paidAmount;
  dynamic _paymentType;
  String? _paymentStatus;
  String? _customerPaymentId;
  dynamic _orderAddress;
  String? _orderDatetime;
  dynamic _deliveryDatetime;
  String? _orderAcceptTime;
  String? _deliveryTime;
  String? _itemsPickTime;
  int? _distance;
  int? _deliverySpeed;
  String? _createdAt;
  String? _updatedAt;
  List<OrderDetails>? _orderDetails;
  DeliveryMan? _deliveryMan;
  Customer? _customer;
Message copyWith({  int? id,
  int? serviceProviderId,
  int? customerId,
  int? deliveryManId,
  String? orderCode,
  int? offerId,
  int? orderStatusId,
  int? totalAmount,
  int? discount,
  int? deliveryFee,
  int? paidAmount,
  dynamic paymentType,
  String? paymentStatus,
  String? customerPaymentId,
  dynamic orderAddress,
  String? orderDatetime,
  dynamic deliveryDatetime,
  String? orderAcceptTime,
  String? deliveryTime,
  String? itemsPickTime,
  int? distance,
  int? deliverySpeed,
  String? createdAt,
  String? updatedAt,
  List<OrderDetails>? orderDetails,
  DeliveryMan? deliveryMan,
  Customer? customer,
}) => Message(  id: id ?? _id,
  serviceProviderId: serviceProviderId ?? _serviceProviderId,
  customerId: customerId ?? _customerId,
  deliveryManId: deliveryManId ?? _deliveryManId,
  orderCode: orderCode ?? _orderCode,
  offerId: offerId ?? _offerId,
  orderStatusId: orderStatusId ?? _orderStatusId,
  totalAmount: totalAmount ?? _totalAmount,
  discount: discount ?? _discount,
  deliveryFee: deliveryFee ?? _deliveryFee,
  paidAmount: paidAmount ?? _paidAmount,
  paymentType: paymentType ?? _paymentType,
  paymentStatus: paymentStatus ?? _paymentStatus,
  customerPaymentId: customerPaymentId ?? _customerPaymentId,
  orderAddress: orderAddress ?? _orderAddress,
  orderDatetime: orderDatetime ?? _orderDatetime,
  deliveryDatetime: deliveryDatetime ?? _deliveryDatetime,
  orderAcceptTime: orderAcceptTime ?? _orderAcceptTime,
  deliveryTime: deliveryTime ?? _deliveryTime,
  itemsPickTime: itemsPickTime ?? _itemsPickTime,
  distance: distance ?? _distance,
  deliverySpeed: deliverySpeed ?? _deliverySpeed,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  orderDetails: orderDetails ?? _orderDetails,
  deliveryMan: deliveryMan ?? _deliveryMan,
  customer: customer ?? _customer,
);
  int? get id => _id;
  int? get serviceProviderId => _serviceProviderId;
  int? get customerId => _customerId;
  int? get deliveryManId => _deliveryManId;
  String? get orderCode => _orderCode;
  int? get offerId => _offerId;
  int? get orderStatusId => _orderStatusId;
  int? get totalAmount => _totalAmount;
  int? get discount => _discount;
  int? get deliveryFee => _deliveryFee;
  int? get paidAmount => _paidAmount;
  dynamic get paymentType => _paymentType;
  String? get paymentStatus => _paymentStatus;
  String? get customerPaymentId => _customerPaymentId;
  dynamic get orderAddress => _orderAddress;
  String? get orderDatetime => _orderDatetime;
  dynamic get deliveryDatetime => _deliveryDatetime;
  String? get orderAcceptTime => _orderAcceptTime;
  String? get deliveryTime => _deliveryTime;
  String? get itemsPickTime => _itemsPickTime;
  int? get distance => _distance;
  int? get deliverySpeed => _deliverySpeed;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<OrderDetails>? get orderDetails => _orderDetails;
  DeliveryMan? get deliveryMan => _deliveryMan;
  Customer? get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['service_provider_id'] = _serviceProviderId;
    map['customer_id'] = _customerId;
    map['delivery_man_id'] = _deliveryManId;
    map['order_code'] = _orderCode;
    map['offer_id'] = _offerId;
    map['order_status_id'] = _orderStatusId;
    map['total_amount'] = _totalAmount;
    map['discount'] = _discount;
    map['delivery_fee'] = _deliveryFee;
    map['paid_amount'] = _paidAmount;
    map['payment_type'] = _paymentType;
    map['payment_status'] = _paymentStatus;
    map['customer_payment_id'] = _customerPaymentId;
    map['order_address'] = _orderAddress;
    map['order_datetime'] = _orderDatetime;
    map['delivery_datetime'] = _deliveryDatetime;
    map['order_accept_time'] = _orderAcceptTime;
    map['delivery_time'] = _deliveryTime;
    map['items_pick_time'] = _itemsPickTime;
    map['distance'] = _distance;
    map['delivery_speed'] = _deliverySpeed;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_orderDetails != null) {
      map['order_details'] = _orderDetails!.map((v) => v.toJson()).toList();
    }
    if (_deliveryMan != null) {
      map['delivery_man'] = _deliveryMan!.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer!.toJson();
    }
    return map;
  }

}

/// id : 2
/// full_name : "Hasib"
/// address : "1 Stockton St,Union Square,San Francisco,Vereinigte Staaten"
/// email : "hasib01@gmail.com"
/// phone : "+8803883848588"
/// photo : null
/// gender_id : null
/// country_id : 880
/// description : null
/// card_number : "0"
/// device_token : null
/// card_cvc : "0"
/// lat_value : "0.000000"
/// long_value : "0.000000"
/// created_at : "2022-04-13T21:05:47.000000Z"
/// updated_at : "2022-04-13T21:05:47.000000Z"

class Customer {
  Customer({
      int? id, 
      String? fullName, 
      String? address, 
      String? email, 
      String? phone, 
      dynamic photo, 
      dynamic genderId, 
      int? countryId, 
      dynamic description, 
      String? cardNumber, 
      dynamic deviceToken, 
      String? cardCvc, 
      String? latValue, 
      String? longValue, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _fullName = fullName;
    _address = address;
    _email = email;
    _phone = phone;
    _photo = photo;
    _genderId = genderId;
    _countryId = countryId;
    _description = description;
    _cardNumber = cardNumber;
    _deviceToken = deviceToken;
    _cardCvc = cardCvc;
    _latValue = latValue;
    _longValue = longValue;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _photo = json['photo'];
    _genderId = json['gender_id'];
    _countryId = json['country_id'];
    _description = json['description'];
    _cardNumber = json['card_number'];
    _deviceToken = json['device_token'];
    _cardCvc = json['card_cvc'];
    _latValue = json['lat_value'];
    _longValue = json['long_value'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _fullName;
  String? _address;
  String? _email;
  String? _phone;
  dynamic _photo;
  dynamic _genderId;
  int? _countryId;
  dynamic _description;
  String? _cardNumber;
  dynamic _deviceToken;
  String? _cardCvc;
  String? _latValue;
  String? _longValue;
  String? _createdAt;
  String? _updatedAt;
Customer copyWith({  int? id,
  String? fullName,
  String? address,
  String? email,
  String? phone,
  dynamic photo,
  dynamic genderId,
  int? countryId,
  dynamic description,
  String? cardNumber,
  dynamic deviceToken,
  String? cardCvc,
  String? latValue,
  String? longValue,
  String? createdAt,
  String? updatedAt,
}) => Customer(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  address: address ?? _address,
  email: email ?? _email,
  phone: phone ?? _phone,
  photo: photo ?? _photo,
  genderId: genderId ?? _genderId,
  countryId: countryId ?? _countryId,
  description: description ?? _description,
  cardNumber: cardNumber ?? _cardNumber,
  deviceToken: deviceToken ?? _deviceToken,
  cardCvc: cardCvc ?? _cardCvc,
  latValue: latValue ?? _latValue,
  longValue: longValue ?? _longValue,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get fullName => _fullName;
  String? get address => _address;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get photo => _photo;
  dynamic get genderId => _genderId;
  int? get countryId => _countryId;
  dynamic get description => _description;
  String? get cardNumber => _cardNumber;
  dynamic get deviceToken => _deviceToken;
  String? get cardCvc => _cardCvc;
  String? get latValue => _latValue;
  String? get longValue => _longValue;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['address'] = _address;
    map['email'] = _email;
    map['phone'] = _phone;
    map['photo'] = _photo;
    map['gender_id'] = _genderId;
    map['country_id'] = _countryId;
    map['description'] = _description;
    map['card_number'] = _cardNumber;
    map['device_token'] = _deviceToken;
    map['card_cvc'] = _cardCvc;
    map['lat_value'] = _latValue;
    map['long_value'] = _longValue;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 2
/// delivery_man_ID : "DM-+880-2"
/// full_name : "Hasib"
/// address : "Dhaka"
/// email : "hasib74@gmail.com"
/// phone : "8801731540704"
/// delivery_men_image : "uploads/delivery_men_photos/739036.jpg"
/// delivery_men_ID_card : "uploads/delivery_men_ID_card/1000000.jpg"
/// is_active : 1
/// gender : null
/// country_id : 880
/// vehicle_type : null
/// description : null
/// avg_rating : 0
/// ranking_level : 5
/// avg_speed : 0
/// efficiency_rate : 0
/// no_of_task_done : 0
/// response_rate : 0
/// working_area : null
/// lat_value : "23.984580"
/// long_value : "89.984580"
/// create_by : 9
/// joining_date : "1651949885"
/// device_token : "eOdfO2r_T4eebKfNNTHkYc:APA91bFn-lvWlKB9Gfwmlb31wH5lMbKCqB58C8yXmJpHEe5GzgKgRp1ieZCdSlTwAXKjbJ_QCBIk6HDk00Vm27z2jKz80tlzxHlrSz3qsmyt3gwlzB1sWqaKa7xkgrjf8FPHHsh-3S3U"

class DeliveryMan {
  DeliveryMan({
      int? id, 
      String? deliveryManID, 
      String? fullName, 
      String? address, 
      String? email, 
      String? phone, 
      String? deliveryMenImage, 
      String? deliveryMenIDCard, 
      int? isActive, 
      dynamic gender, 
      int? countryId, 
      dynamic vehicleType, 
      dynamic description, 
      int? avgRating, 
      int? rankingLevel, 
      int? avgSpeed, 
      int? efficiencyRate, 
      int? noOfTaskDone, 
      int? responseRate, 
      dynamic workingArea, 
      String? latValue, 
      String? longValue, 
      int? createBy, 
      String? joiningDate, 
      String? deviceToken,}){
    _id = id;
    _deliveryManID = deliveryManID;
    _fullName = fullName;
    _address = address;
    _email = email;
    _phone = phone;
    _deliveryMenImage = deliveryMenImage;
    _deliveryMenIDCard = deliveryMenIDCard;
    _isActive = isActive;
    _gender = gender;
    _countryId = countryId;
    _vehicleType = vehicleType;
    _description = description;
    _avgRating = avgRating;
    _rankingLevel = rankingLevel;
    _avgSpeed = avgSpeed;
    _efficiencyRate = efficiencyRate;
    _noOfTaskDone = noOfTaskDone;
    _responseRate = responseRate;
    _workingArea = workingArea;
    _latValue = latValue;
    _longValue = longValue;
    _createBy = createBy;
    _joiningDate = joiningDate;
    _deviceToken = deviceToken;
}

  DeliveryMan.fromJson(dynamic json) {
    _id = json['id'];
    _deliveryManID = json['delivery_man_ID'];
    _fullName = json['full_name'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _deliveryMenImage = json['delivery_men_image'];
    _deliveryMenIDCard = json['delivery_men_ID_card'];
    _isActive = json['is_active'];
    _gender = json['gender'];
    _countryId = json['country_id'];
    _vehicleType = json['vehicle_type'];
    _description = json['description'];
    _avgRating = json['avg_rating'];
    _rankingLevel = json['ranking_level'];
    _avgSpeed = json['avg_speed'];
    _efficiencyRate = json['efficiency_rate'];
    _noOfTaskDone = json['no_of_task_done'];
    _responseRate = json['response_rate'];
    _workingArea = json['working_area'];
    _latValue = json['lat_value'];
    _longValue = json['long_value'];
    _createBy = json['create_by'];
    _joiningDate = json['joining_date'];
    _deviceToken = json['device_token'];
  }
  int? _id;
  String? _deliveryManID;
  String? _fullName;
  String? _address;
  String? _email;
  String? _phone;
  String? _deliveryMenImage;
  String? _deliveryMenIDCard;
  int? _isActive;
  dynamic _gender;
  int? _countryId;
  dynamic _vehicleType;
  dynamic _description;
  int? _avgRating;
  int? _rankingLevel;
  int? _avgSpeed;
  int? _efficiencyRate;
  int? _noOfTaskDone;
  int? _responseRate;
  dynamic _workingArea;
  String? _latValue;
  String? _longValue;
  int? _createBy;
  String? _joiningDate;
  String? _deviceToken;
DeliveryMan copyWith({  int? id,
  String? deliveryManID,
  String? fullName,
  String? address,
  String? email,
  String? phone,
  String? deliveryMenImage,
  String? deliveryMenIDCard,
  int? isActive,
  dynamic gender,
  int? countryId,
  dynamic vehicleType,
  dynamic description,
  int? avgRating,
  int? rankingLevel,
  int? avgSpeed,
  int? efficiencyRate,
  int? noOfTaskDone,
  int? responseRate,
  dynamic workingArea,
  String? latValue,
  String? longValue,
  int? createBy,
  String? joiningDate,
  String? deviceToken,
}) => DeliveryMan(  id: id ?? _id,
  deliveryManID: deliveryManID ?? _deliveryManID,
  fullName: fullName ?? _fullName,
  address: address ?? _address,
  email: email ?? _email,
  phone: phone ?? _phone,
  deliveryMenImage: deliveryMenImage ?? _deliveryMenImage,
  deliveryMenIDCard: deliveryMenIDCard ?? _deliveryMenIDCard,
  isActive: isActive ?? _isActive,
  gender: gender ?? _gender,
  countryId: countryId ?? _countryId,
  vehicleType: vehicleType ?? _vehicleType,
  description: description ?? _description,
  avgRating: avgRating ?? _avgRating,
  rankingLevel: rankingLevel ?? _rankingLevel,
  avgSpeed: avgSpeed ?? _avgSpeed,
  efficiencyRate: efficiencyRate ?? _efficiencyRate,
  noOfTaskDone: noOfTaskDone ?? _noOfTaskDone,
  responseRate: responseRate ?? _responseRate,
  workingArea: workingArea ?? _workingArea,
  latValue: latValue ?? _latValue,
  longValue: longValue ?? _longValue,
  createBy: createBy ?? _createBy,
  joiningDate: joiningDate ?? _joiningDate,
  deviceToken: deviceToken ?? _deviceToken,
);
  int? get id => _id;
  String? get deliveryManID => _deliveryManID;
  String? get fullName => _fullName;
  String? get address => _address;
  String? get email => _email;
  String? get phone => _phone;
  String? get deliveryMenImage => _deliveryMenImage;
  String? get deliveryMenIDCard => _deliveryMenIDCard;
  int? get isActive => _isActive;
  dynamic get gender => _gender;
  int? get countryId => _countryId;
  dynamic get vehicleType => _vehicleType;
  dynamic get description => _description;
  int? get avgRating => _avgRating;
  int? get rankingLevel => _rankingLevel;
  int? get avgSpeed => _avgSpeed;
  int? get efficiencyRate => _efficiencyRate;
  int? get noOfTaskDone => _noOfTaskDone;
  int? get responseRate => _responseRate;
  dynamic get workingArea => _workingArea;
  String? get latValue => _latValue;
  String? get longValue => _longValue;
  int? get createBy => _createBy;
  String? get joiningDate => _joiningDate;
  String? get deviceToken => _deviceToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['delivery_man_ID'] = _deliveryManID;
    map['full_name'] = _fullName;
    map['address'] = _address;
    map['email'] = _email;
    map['phone'] = _phone;
    map['delivery_men_image'] = _deliveryMenImage;
    map['delivery_men_ID_card'] = _deliveryMenIDCard;
    map['is_active'] = _isActive;
    map['gender'] = _gender;
    map['country_id'] = _countryId;
    map['vehicle_type'] = _vehicleType;
    map['description'] = _description;
    map['avg_rating'] = _avgRating;
    map['ranking_level'] = _rankingLevel;
    map['avg_speed'] = _avgSpeed;
    map['efficiency_rate'] = _efficiencyRate;
    map['no_of_task_done'] = _noOfTaskDone;
    map['response_rate'] = _responseRate;
    map['working_area'] = _workingArea;
    map['lat_value'] = _latValue;
    map['long_value'] = _longValue;
    map['create_by'] = _createBy;
    map['joining_date'] = _joiningDate;
    map['device_token'] = _deviceToken;
    return map;
  }

}

/// id : 3
/// order_id : 3
/// product_name_id : 2
/// product_name : null
/// amount : 229
/// quantity : 1

class OrderDetails {
  OrderDetails({
      int? id, 
      int? orderId, 
      int? productNameId, 
      dynamic productName, 
      int? amount, 
      int? quantity,}){
    _id = id;
    _orderId = orderId;
    _productNameId = productNameId;
    _productName = productName;
    _amount = amount;
    _quantity = quantity;
}

  OrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _productNameId = json['product_name_id'];
    _productName = json['product_name'];
    _amount = json['amount'];
    _quantity = json['quantity'];
  }
  int? _id;
  int? _orderId;
  int? _productNameId;
  dynamic _productName;
  int? _amount;
  int? _quantity;
OrderDetails copyWith({  int? id,
  int? orderId,
  int? productNameId,
  dynamic productName,
  int? amount,
  int? quantity,
}) => OrderDetails(  id: id ?? _id,
  orderId: orderId ?? _orderId,
  productNameId: productNameId ?? _productNameId,
  productName: productName ?? _productName,
  amount: amount ?? _amount,
  quantity: quantity ?? _quantity,
);
  int? get id => _id;
  int? get orderId => _orderId;
  int? get productNameId => _productNameId;
  dynamic get productName => _productName;
  int? get amount => _amount;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['product_name_id'] = _productNameId;
    map['product_name'] = _productName;
    map['amount'] = _amount;
    map['quantity'] = _quantity;
    return map;
  }

}