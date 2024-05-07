/// success : "true"
/// status_code : "200"
/// message : [{"id":47,"service_provider_id":7,"customer_id":6,"delivery_man_id":4,"order_code":"OR-47","offer_id":3,"order_status_id":40,"total_amount":2,"discount":10,"delivery_fee":0,"paid_amount":3,"payment_type":null,"payment_status":"pending","customer_payment_id":"","order_address":"1312 Begum Rokeya Avenue, Dhaka, Bangladesh","order_datetime":"2022-05-30 17:54:22","order_address_lat_value":"23.801093","order_address_long_value":"90.371929","delivery_datetime":null,"order_accept_time":"0","delivery_time":"0","items_pick_time":"0","distance":0,"delivery_speed":0,"created_at":"2022-05-30T17:54:22.000000Z","updated_at":"2022-06-07T18:55:45.000000Z","order_details":[{"id":17,"order_id":47,"product_name_id":12,"product_name":"Burger offers","amount":3,"quantity":1}],"delivery_man":{"id":4,"delivery_man_ID":"DM-+880-4","full_name":"MR.Driver","address":"Q9XF+3F9, Dhaka, Bangladesh","email":"driver@gmail.com","phone":"88099394888566","delivery_men_image":"uploads/delivery_men_photos/1000000.jpg","delivery_men_ID_card":"uploads/delivery_men_ID_card/999999.jpg","is_active":1,"gender":null,"country_id":880,"vehicle_type":null,"description":null,"avg_rating":0,"ranking_level":5,"avg_speed":0,"efficiency_rate":0,"no_of_task_done":0,"response_rate":0,"working_area":null,"lat_value":"23.798096","long_value":"90.373938","create_by":1,"joining_date":"1653760517","device_token":"eHetCsXlQoC665UCOwgWED:APA91bG4amb1Si0SiqtbEBp_fecrMYUQKFZrdsWPVDYWMOgScTvYrZdGxhjqonboovGAfz_RFLug_lg_2V-Rb2Vd-O7f86UftN2n2etoDMUuIxyFjigTDSqEL_L1cKMkLR-IXPqOTePQ"},"vendor":{"id":7,"full_name":"Laboni","address":"1308 Begum Rokeya Avenue, Dhaka, Bangladesh","email":"laboni@gmail.com","phone":"8801727123374","description":null,"shop_name":"laboni point","updated_by":null,"vendor_image":"","opening_at":"3:15 AM","closing_at":"4:15 PM","rating":"0.0","country_id":null,"state_id":null,"city_id":null,"zip":null,"delivery_charge":null,"lat_value":"23.801228","long_value":"90.371112","is_active":0,"device_token":"cKuYJmhXQzqOXnVlyvlGVG:APA91bHfRqbzHykPVVXPnKu5DSOkbzVigoQHujfPCCWx6st7wNv_Byn7kzKCq7JsFDTnYOIQ47AzQpny_kiCecMaLU-247oukKP2uNh7Xu6wKGPMhvleJmQTbBNrbFjHu12SW806EMYU","created_at":"2022-05-28T18:13:05.000000Z","updated_at":"2022-06-07T18:42:17.000000Z"},"customer":{"id":6,"full_name":"User","address":"850/1East,মিরপুর,ঢাকা,Bangladesh","email":"user@gmail.com","phone":"+8806464646464","photo":null,"gender_id":null,"country_id":880,"description":null,"card_number":"0","device_token":"ew_TmDDaRDOG8BWdU8TLKb:APA91bF1UYRFKobtjEPmPVCxj3mp8ru6vQoaZeUAQzUbR1aao7TtGa5DGPO_Jdw83d98dW0drnBsIF4-tCwhFZKPrUIDW_geJd_gTmkvv-JLRABbBjCWubmECjAPqRU32lJz8dlMd_Fx","card_cvc":"0","lat_value":"23.797376","long_value":"90.375235","created_at":"2022-05-28T18:27:03.000000Z","updated_at":"2022-06-15T16:54:28.000000Z"}}]

class ReadyToDeliveryHistoryModel {
  ReadyToDeliveryHistoryModel({
      String? success, 
      String? statusCode, 
      List<Message>? message,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
}

  ReadyToDeliveryHistoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['status_code'];
    if (json['message'] != null) {

      if( json['message'] == "Invalid:Data Not Found"){

        _message = [];
      }else{

        _message = [];
        json['message'].forEach((v) {
          _message!.add(Message.fromJson(v));
        });
      }

    }
  }
  String? _success;
  String? _statusCode;
  List<Message>? _message;
ReadyToDeliveryHistoryModel copyWith({  String? success,
  String? statusCode,
  List<Message>? message,
}) => ReadyToDeliveryHistoryModel(  success: success ?? _success,
  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
);
  String? get success => _success;
  String? get statusCode => _statusCode;
  List<Message>? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['status_code'] = _statusCode;
    if (_message != null) {
      map['message'] = _message!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 47
/// service_provider_id : 7
/// customer_id : 6
/// delivery_man_id : 4
/// order_code : "OR-47"
/// offer_id : 3
/// order_status_id : 40
/// total_amount : 2
/// discount : 10
/// delivery_fee : 0
/// paid_amount : 3
/// payment_type : null
/// payment_status : "pending"
/// customer_payment_id : ""
/// order_address : "1312 Begum Rokeya Avenue, Dhaka, Bangladesh"
/// order_datetime : "2022-05-30 17:54:22"
/// order_address_lat_value : "23.801093"
/// order_address_long_value : "90.371929"
/// delivery_datetime : null
/// order_accept_time : "0"
/// delivery_time : "0"
/// items_pick_time : "0"
/// distance : 0
/// delivery_speed : 0
/// created_at : "2022-05-30T17:54:22.000000Z"
/// updated_at : "2022-06-07T18:55:45.000000Z"
/// order_details : [{"id":17,"order_id":47,"product_name_id":12,"product_name":"Burger offers","amount":3,"quantity":1}]
/// delivery_man : {"id":4,"delivery_man_ID":"DM-+880-4","full_name":"MR.Driver","address":"Q9XF+3F9, Dhaka, Bangladesh","email":"driver@gmail.com","phone":"88099394888566","delivery_men_image":"uploads/delivery_men_photos/1000000.jpg","delivery_men_ID_card":"uploads/delivery_men_ID_card/999999.jpg","is_active":1,"gender":null,"country_id":880,"vehicle_type":null,"description":null,"avg_rating":0,"ranking_level":5,"avg_speed":0,"efficiency_rate":0,"no_of_task_done":0,"response_rate":0,"working_area":null,"lat_value":"23.798096","long_value":"90.373938","create_by":1,"joining_date":"1653760517","device_token":"eHetCsXlQoC665UCOwgWED:APA91bG4amb1Si0SiqtbEBp_fecrMYUQKFZrdsWPVDYWMOgScTvYrZdGxhjqonboovGAfz_RFLug_lg_2V-Rb2Vd-O7f86UftN2n2etoDMUuIxyFjigTDSqEL_L1cKMkLR-IXPqOTePQ"}
/// vendor : {"id":7,"full_name":"Laboni","address":"1308 Begum Rokeya Avenue, Dhaka, Bangladesh","email":"laboni@gmail.com","phone":"8801727123374","description":null,"shop_name":"laboni point","updated_by":null,"vendor_image":"","opening_at":"3:15 AM","closing_at":"4:15 PM","rating":"0.0","country_id":null,"state_id":null,"city_id":null,"zip":null,"delivery_charge":null,"lat_value":"23.801228","long_value":"90.371112","is_active":0,"device_token":"cKuYJmhXQzqOXnVlyvlGVG:APA91bHfRqbzHykPVVXPnKu5DSOkbzVigoQHujfPCCWx6st7wNv_Byn7kzKCq7JsFDTnYOIQ47AzQpny_kiCecMaLU-247oukKP2uNh7Xu6wKGPMhvleJmQTbBNrbFjHu12SW806EMYU","created_at":"2022-05-28T18:13:05.000000Z","updated_at":"2022-06-07T18:42:17.000000Z"}
/// customer : {"id":6,"full_name":"User","address":"850/1East,মিরপুর,ঢাকা,Bangladesh","email":"user@gmail.com","phone":"+8806464646464","photo":null,"gender_id":null,"country_id":880,"description":null,"card_number":"0","device_token":"ew_TmDDaRDOG8BWdU8TLKb:APA91bF1UYRFKobtjEPmPVCxj3mp8ru6vQoaZeUAQzUbR1aao7TtGa5DGPO_Jdw83d98dW0drnBsIF4-tCwhFZKPrUIDW_geJd_gTmkvv-JLRABbBjCWubmECjAPqRU32lJz8dlMd_Fx","card_cvc":"0","lat_value":"23.797376","long_value":"90.375235","created_at":"2022-05-28T18:27:03.000000Z","updated_at":"2022-06-15T16:54:28.000000Z"}

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
      String? orderAddress, 
      String? orderDatetime, 
      String? orderAddressLatValue, 
      String? orderAddressLongValue, 
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
      Vendor? vendor, 
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
    _orderAddressLatValue = orderAddressLatValue;
    _orderAddressLongValue = orderAddressLongValue;
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
    _vendor = vendor;
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
    _orderAddressLatValue = json['order_address_lat_value'];
    _orderAddressLongValue = json['order_address_long_value'];
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
    _vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
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
  String? _orderAddress;
  String? _orderDatetime;
  String? _orderAddressLatValue;
  String? _orderAddressLongValue;
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
  Vendor? _vendor;
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
  String? orderAddress,
  String? orderDatetime,
  String? orderAddressLatValue,
  String? orderAddressLongValue,
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
  Vendor? vendor,
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
  orderAddressLatValue: orderAddressLatValue ?? _orderAddressLatValue,
  orderAddressLongValue: orderAddressLongValue ?? _orderAddressLongValue,
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
  vendor: vendor ?? _vendor,
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
  String? get orderAddress => _orderAddress;
  String? get orderDatetime => _orderDatetime;
  String? get orderAddressLatValue => _orderAddressLatValue;
  String? get orderAddressLongValue => _orderAddressLongValue;
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
  Vendor? get vendor => _vendor;
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
    map['order_address_lat_value'] = _orderAddressLatValue;
    map['order_address_long_value'] = _orderAddressLongValue;
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
    if (_vendor != null) {
      map['vendor'] = _vendor!.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer!.toJson();
    }
    return map;
  }

}

/// id : 6
/// full_name : "User"
/// address : "850/1East,মিরপুর,ঢাকা,Bangladesh"
/// email : "user@gmail.com"
/// phone : "+8806464646464"
/// photo : null
/// gender_id : null
/// country_id : 880
/// description : null
/// card_number : "0"
/// device_token : "ew_TmDDaRDOG8BWdU8TLKb:APA91bF1UYRFKobtjEPmPVCxj3mp8ru6vQoaZeUAQzUbR1aao7TtGa5DGPO_Jdw83d98dW0drnBsIF4-tCwhFZKPrUIDW_geJd_gTmkvv-JLRABbBjCWubmECjAPqRU32lJz8dlMd_Fx"
/// card_cvc : "0"
/// lat_value : "23.797376"
/// long_value : "90.375235"
/// created_at : "2022-05-28T18:27:03.000000Z"
/// updated_at : "2022-06-15T16:54:28.000000Z"

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
      String? deviceToken, 
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
  String? _deviceToken;
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
  String? deviceToken,
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
  String? get deviceToken => _deviceToken;
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

/// id : 7
/// full_name : "Laboni"
/// address : "1308 Begum Rokeya Avenue, Dhaka, Bangladesh"
/// email : "laboni@gmail.com"
/// phone : "8801727123374"
/// description : null
/// shop_name : "laboni point"
/// updated_by : null
/// vendor_image : ""
/// opening_at : "3:15 AM"
/// closing_at : "4:15 PM"
/// rating : "0.0"
/// country_id : null
/// state_id : null
/// city_id : null
/// zip : null
/// delivery_charge : null
/// lat_value : "23.801228"
/// long_value : "90.371112"
/// is_active : 0
/// device_token : "cKuYJmhXQzqOXnVlyvlGVG:APA91bHfRqbzHykPVVXPnKu5DSOkbzVigoQHujfPCCWx6st7wNv_Byn7kzKCq7JsFDTnYOIQ47AzQpny_kiCecMaLU-247oukKP2uNh7Xu6wKGPMhvleJmQTbBNrbFjHu12SW806EMYU"
/// created_at : "2022-05-28T18:13:05.000000Z"
/// updated_at : "2022-06-07T18:42:17.000000Z"

class Vendor {
  Vendor({
      int? id, 
      String? fullName, 
      String? address, 
      String? email, 
      String? phone, 
      dynamic description, 
      String? shopName, 
      dynamic updatedBy, 
      String? vendorImage, 
      String? openingAt, 
      String? closingAt, 
      String? rating, 
      dynamic countryId, 
      dynamic stateId, 
      dynamic cityId, 
      dynamic zip, 
      dynamic deliveryCharge, 
      String? latValue, 
      String? longValue, 
      int? isActive, 
      String? deviceToken, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _fullName = fullName;
    _address = address;
    _email = email;
    _phone = phone;
    _description = description;
    _shopName = shopName;
    _updatedBy = updatedBy;
    _vendorImage = vendorImage;
    _openingAt = openingAt;
    _closingAt = closingAt;
    _rating = rating;
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
    _zip = zip;
    _deliveryCharge = deliveryCharge;
    _latValue = latValue;
    _longValue = longValue;
    _isActive = isActive;
    _deviceToken = deviceToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Vendor.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _description = json['description'];
    _shopName = json['shop_name'];
    _updatedBy = json['updated_by'];
    _vendorImage = json['vendor_image'];
    _openingAt = json['opening_at'];
    _closingAt = json['closing_at'];
    _rating = json['rating'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _zip = json['zip'];
    _deliveryCharge = json['delivery_charge'];
    _latValue = json['lat_value'];
    _longValue = json['long_value'];
    _isActive = json['is_active'];
    _deviceToken = json['device_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _fullName;
  String? _address;
  String? _email;
  String? _phone;
  dynamic _description;
  String? _shopName;
  dynamic _updatedBy;
  String? _vendorImage;
  String? _openingAt;
  String? _closingAt;
  String? _rating;
  dynamic _countryId;
  dynamic _stateId;
  dynamic _cityId;
  dynamic _zip;
  dynamic _deliveryCharge;
  String? _latValue;
  String? _longValue;
  int? _isActive;
  String? _deviceToken;
  String? _createdAt;
  String? _updatedAt;
Vendor copyWith({  int? id,
  String? fullName,
  String? address,
  String? email,
  String? phone,
  dynamic description,
  String? shopName,
  dynamic updatedBy,
  String? vendorImage,
  String? openingAt,
  String? closingAt,
  String? rating,
  dynamic countryId,
  dynamic stateId,
  dynamic cityId,
  dynamic zip,
  dynamic deliveryCharge,
  String? latValue,
  String? longValue,
  int? isActive,
  String? deviceToken,
  String? createdAt,
  String? updatedAt,
}) => Vendor(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  address: address ?? _address,
  email: email ?? _email,
  phone: phone ?? _phone,
  description: description ?? _description,
  shopName: shopName ?? _shopName,
  updatedBy: updatedBy ?? _updatedBy,
  vendorImage: vendorImage ?? _vendorImage,
  openingAt: openingAt ?? _openingAt,
  closingAt: closingAt ?? _closingAt,
  rating: rating ?? _rating,
  countryId: countryId ?? _countryId,
  stateId: stateId ?? _stateId,
  cityId: cityId ?? _cityId,
  zip: zip ?? _zip,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  latValue: latValue ?? _latValue,
  longValue: longValue ?? _longValue,
  isActive: isActive ?? _isActive,
  deviceToken: deviceToken ?? _deviceToken,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get fullName => _fullName;
  String? get address => _address;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get description => _description;
  String? get shopName => _shopName;
  dynamic get updatedBy => _updatedBy;
  String? get vendorImage => _vendorImage;
  String? get openingAt => _openingAt;
  String? get closingAt => _closingAt;
  String? get rating => _rating;
  dynamic get countryId => _countryId;
  dynamic get stateId => _stateId;
  dynamic get cityId => _cityId;
  dynamic get zip => _zip;
  dynamic get deliveryCharge => _deliveryCharge;
  String? get latValue => _latValue;
  String? get longValue => _longValue;
  int? get isActive => _isActive;
  String? get deviceToken => _deviceToken;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['address'] = _address;
    map['email'] = _email;
    map['phone'] = _phone;
    map['description'] = _description;
    map['shop_name'] = _shopName;
    map['updated_by'] = _updatedBy;
    map['vendor_image'] = _vendorImage;
    map['opening_at'] = _openingAt;
    map['closing_at'] = _closingAt;
    map['rating'] = _rating;
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['zip'] = _zip;
    map['delivery_charge'] = _deliveryCharge;
    map['lat_value'] = _latValue;
    map['long_value'] = _longValue;
    map['is_active'] = _isActive;
    map['device_token'] = _deviceToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 4
/// delivery_man_ID : "DM-+880-4"
/// full_name : "MR.Driver"
/// address : "Q9XF+3F9, Dhaka, Bangladesh"
/// email : "driver@gmail.com"
/// phone : "88099394888566"
/// delivery_men_image : "uploads/delivery_men_photos/1000000.jpg"
/// delivery_men_ID_card : "uploads/delivery_men_ID_card/999999.jpg"
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
/// lat_value : "23.798096"
/// long_value : "90.373938"
/// create_by : 1
/// joining_date : "1653760517"
/// device_token : "eHetCsXlQoC665UCOwgWED:APA91bG4amb1Si0SiqtbEBp_fecrMYUQKFZrdsWPVDYWMOgScTvYrZdGxhjqonboovGAfz_RFLug_lg_2V-Rb2Vd-O7f86UftN2n2etoDMUuIxyFjigTDSqEL_L1cKMkLR-IXPqOTePQ"

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

/// id : 17
/// order_id : 47
/// product_name_id : 12
/// product_name : "Burger offers"
/// amount : 3
/// quantity : 1

class OrderDetails {
  OrderDetails({
      int? id, 
      int? orderId, 
      int? productNameId, 
      String? productName, 
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
  String? _productName;
  int? _amount;
  int? _quantity;
OrderDetails copyWith({  int? id,
  int? orderId,
  int? productNameId,
  String? productName,
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
  String? get productName => _productName;
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