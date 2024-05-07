/// response : [{"id":162,"service_provider_id":1,"delivery_men_id":11,"delivery_men_status":null,"delivery_men_expire_time":null,"service_table_id":1,"customer_id":1,"customer_email":"hasib@gmail.com","customer_number":null,"order_code":"OR-162","pickup_option":null,"offer_id":1,"order_status":15,"payment_reference":null,"total_amount":"91.92","discount":"0.00","paid_amount":"91.92","payment_method":null,"payment_meta":null,"payment_status":"pending","customer_payment_id":"","lat_value":null,"long_value":null,"created_at":"2023-07-26T16:25:33.000000Z","updated_at":"2023-07-26T16:25:33.000000Z","order_details":[{"order_details_id":292,"order_id":162,"product_name_id":2,"amount":"11.99000","quantity":4},{"order_details_id":293,"order_id":162,"product_name_id":3,"amount":"10.99000","quantity":4}],"customer":{"customer_id":1,"full_name":"Hasib","email":"hasib@gmail.com","phone":"+01727123374","address":"Dhaka Mirpur","device_token":"eBRFMVKcNkr2ghHu1vT2FV:APA91bFAH7k3BmR6VLsqypmvALu9rZyETwyTh0ghY-3fnoyq1msAJTdq8Z6wbx_ifBcbVjXdD-7c0oYErS8xtMBoUHZVEAfVXuow3MR-2t6qAgw5CI7SGVTZdyvfzvcSXBezi2JrlXfd","created_at":"2023-06-12T17:12:17.000000Z","updated_at":"2023-07-27T16:21:31.000000Z"}}]

class NewOrderModel {
  NewOrderModel({
      List<Response>? response,}){
    _response = response;
}

  NewOrderModel.fromJson(dynamic json) {
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  List<Response>? _response;
NewOrderModel copyWith({  List<Response>? response,
}) => NewOrderModel(  response: response ?? _response,
);
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 162
/// service_provider_id : 1
/// delivery_men_id : 11
/// delivery_men_status : null
/// delivery_men_expire_time : null
/// service_table_id : 1
/// customer_id : 1
/// customer_email : "hasib@gmail.com"
/// customer_number : null
/// order_code : "OR-162"
/// pickup_option : null
/// offer_id : 1
/// order_status : 15
/// payment_reference : null
/// total_amount : "91.92"
/// discount : "0.00"
/// paid_amount : "91.92"
/// payment_method : null
/// payment_meta : null
/// payment_status : "pending"
/// customer_payment_id : ""
/// lat_value : null
/// long_value : null
/// created_at : "2023-07-26T16:25:33.000000Z"
/// updated_at : "2023-07-26T16:25:33.000000Z"
/// order_details : [{"order_details_id":292,"order_id":162,"product_name_id":2,"amount":"11.99000","quantity":4},{"order_details_id":293,"order_id":162,"product_name_id":3,"amount":"10.99000","quantity":4}]
/// customer : {"customer_id":1,"full_name":"Hasib","email":"hasib@gmail.com","phone":"+01727123374","address":"Dhaka Mirpur","device_token":"eBRFMVKcNkr2ghHu1vT2FV:APA91bFAH7k3BmR6VLsqypmvALu9rZyETwyTh0ghY-3fnoyq1msAJTdq8Z6wbx_ifBcbVjXdD-7c0oYErS8xtMBoUHZVEAfVXuow3MR-2t6qAgw5CI7SGVTZdyvfzvcSXBezi2JrlXfd","created_at":"2023-06-12T17:12:17.000000Z","updated_at":"2023-07-27T16:21:31.000000Z"}

class Response {
  Response({
      num? id, 
      num? serviceProviderId, 
      num? deliveryMenId, 
      dynamic deliveryMenStatus, 
      dynamic deliveryMenExpireTime, 
      num? serviceTableId, 
      num? customerId, 
      String? customerEmail, 
      dynamic customerNumber, 
      String? orderCode, 
      dynamic pickupOption, 
      num? offerId, 
      num? orderStatus, 
      dynamic paymentReference, 
      String? totalAmount, 
      String? discount, 
      String? paidAmount, 
      dynamic paymentMethod, 
      dynamic paymentMeta, 
      String? paymentStatus, 
      String? customerPaymentId, 
      dynamic latValue, 
      dynamic longValue, 
      String? createdAt, 
      String? updatedAt, 
      List<OrderDetails>? orderDetails, 
      Customer? customer,}){
    _id = id;
    _serviceProviderId = serviceProviderId;
    _deliveryMenId = deliveryMenId;
    _deliveryMenStatus = deliveryMenStatus;
    _deliveryMenExpireTime = deliveryMenExpireTime;
    _serviceTableId = serviceTableId;
    _customerId = customerId;
    _customerEmail = customerEmail;
    _customerNumber = customerNumber;
    _orderCode = orderCode;
    _pickupOption = pickupOption;
    _offerId = offerId;
    _orderStatus = orderStatus;
    _paymentReference = paymentReference;
    _totalAmount = totalAmount;
    _discount = discount;
    _paidAmount = paidAmount;
    _paymentMethod = paymentMethod;
    _paymentMeta = paymentMeta;
    _paymentStatus = paymentStatus;
    _customerPaymentId = customerPaymentId;
    _latValue = latValue;
    _longValue = longValue;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderDetails = orderDetails;
    _customer = customer;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _serviceProviderId = json['service_provider_id'];
    _deliveryMenId = json['delivery_men_id'];
    _deliveryMenStatus = json['delivery_men_status'];
    _deliveryMenExpireTime = json['delivery_men_expire_time'];
    _serviceTableId = json['service_table_id'];
    _customerId = json['customer_id'];
    _customerEmail = json['customer_email'];
    _customerNumber = json['customer_number'];
    _orderCode = json['order_code'];
    _pickupOption = json['pickup_option'];
    _offerId = json['offer_id'];
    _orderStatus = json['order_status'];
    _paymentReference = json['payment_reference'];
    _totalAmount = json['total_amount'];
    _discount = json['discount'];
    _paidAmount = json['paid_amount'];
    _paymentMethod = json['payment_method'];
    _paymentMeta = json['payment_meta'];
    _paymentStatus = json['payment_status'];
    _customerPaymentId = json['customer_payment_id'];
    _latValue = json['lat_value'];
    _longValue = json['long_value'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['order_details'] != null) {
      _orderDetails = [];
      json['order_details'].forEach((v) {
        _orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  num? _id;
  num? _serviceProviderId;
  num? _deliveryMenId;
  dynamic _deliveryMenStatus;
  dynamic _deliveryMenExpireTime;
  num? _serviceTableId;
  num? _customerId;
  String? _customerEmail;
  dynamic _customerNumber;
  String? _orderCode;
  dynamic _pickupOption;
  num? _offerId;
  num? _orderStatus;
  dynamic _paymentReference;
  String? _totalAmount;
  String? _discount;
  String? _paidAmount;
  dynamic _paymentMethod;
  dynamic _paymentMeta;
  String? _paymentStatus;
  String? _customerPaymentId;
  dynamic _latValue;
  dynamic _longValue;
  String? _createdAt;
  String? _updatedAt;
  List<OrderDetails>? _orderDetails;
  Customer? _customer;
Response copyWith({  num? id,
  num? serviceProviderId,
  num? deliveryMenId,
  dynamic deliveryMenStatus,
  dynamic deliveryMenExpireTime,
  num? serviceTableId,
  num? customerId,
  String? customerEmail,
  dynamic customerNumber,
  String? orderCode,
  dynamic pickupOption,
  num? offerId,
  num? orderStatus,
  dynamic paymentReference,
  String? totalAmount,
  String? discount,
  String? paidAmount,
  dynamic paymentMethod,
  dynamic paymentMeta,
  String? paymentStatus,
  String? customerPaymentId,
  dynamic latValue,
  dynamic longValue,
  String? createdAt,
  String? updatedAt,
  List<OrderDetails>? orderDetails,
  Customer? customer,
}) => Response(  id: id ?? _id,
  serviceProviderId: serviceProviderId ?? _serviceProviderId,
  deliveryMenId: deliveryMenId ?? _deliveryMenId,
  deliveryMenStatus: deliveryMenStatus ?? _deliveryMenStatus,
  deliveryMenExpireTime: deliveryMenExpireTime ?? _deliveryMenExpireTime,
  serviceTableId: serviceTableId ?? _serviceTableId,
  customerId: customerId ?? _customerId,
  customerEmail: customerEmail ?? _customerEmail,
  customerNumber: customerNumber ?? _customerNumber,
  orderCode: orderCode ?? _orderCode,
  pickupOption: pickupOption ?? _pickupOption,
  offerId: offerId ?? _offerId,
  orderStatus: orderStatus ?? _orderStatus,
  paymentReference: paymentReference ?? _paymentReference,
  totalAmount: totalAmount ?? _totalAmount,
  discount: discount ?? _discount,
  paidAmount: paidAmount ?? _paidAmount,
  paymentMethod: paymentMethod ?? _paymentMethod,
  paymentMeta: paymentMeta ?? _paymentMeta,
  paymentStatus: paymentStatus ?? _paymentStatus,
  customerPaymentId: customerPaymentId ?? _customerPaymentId,
  latValue: latValue ?? _latValue,
  longValue: longValue ?? _longValue,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  orderDetails: orderDetails ?? _orderDetails,
  customer: customer ?? _customer,
);
  num? get id => _id;
  num? get serviceProviderId => _serviceProviderId;
  num? get deliveryMenId => _deliveryMenId;
  dynamic get deliveryMenStatus => _deliveryMenStatus;
  dynamic get deliveryMenExpireTime => _deliveryMenExpireTime;
  num? get serviceTableId => _serviceTableId;
  num? get customerId => _customerId;
  String? get customerEmail => _customerEmail;
  dynamic get customerNumber => _customerNumber;
  String? get orderCode => _orderCode;
  dynamic get pickupOption => _pickupOption;
  num? get offerId => _offerId;
  num? get orderStatus => _orderStatus;
  dynamic get paymentReference => _paymentReference;
  String? get totalAmount => _totalAmount;
  String? get discount => _discount;
  String? get paidAmount => _paidAmount;
  dynamic get paymentMethod => _paymentMethod;
  dynamic get paymentMeta => _paymentMeta;
  String? get paymentStatus => _paymentStatus;
  String? get customerPaymentId => _customerPaymentId;
  dynamic get latValue => _latValue;
  dynamic get longValue => _longValue;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<OrderDetails>? get orderDetails => _orderDetails;
  Customer? get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['service_provider_id'] = _serviceProviderId;
    map['delivery_men_id'] = _deliveryMenId;
    map['delivery_men_status'] = _deliveryMenStatus;
    map['delivery_men_expire_time'] = _deliveryMenExpireTime;
    map['service_table_id'] = _serviceTableId;
    map['customer_id'] = _customerId;
    map['customer_email'] = _customerEmail;
    map['customer_number'] = _customerNumber;
    map['order_code'] = _orderCode;
    map['pickup_option'] = _pickupOption;
    map['offer_id'] = _offerId;
    map['order_status'] = _orderStatus;
    map['payment_reference'] = _paymentReference;
    map['total_amount'] = _totalAmount;
    map['discount'] = _discount;
    map['paid_amount'] = _paidAmount;
    map['payment_method'] = _paymentMethod;
    map['payment_meta'] = _paymentMeta;
    map['payment_status'] = _paymentStatus;
    map['customer_payment_id'] = _customerPaymentId;
    map['lat_value'] = _latValue;
    map['long_value'] = _longValue;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_orderDetails != null) {
      map['order_details'] = _orderDetails?.map((v) => v.toJson()).toList();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    return map;
  }

}

/// customer_id : 1
/// full_name : "Hasib"
/// email : "hasib@gmail.com"
/// phone : "+01727123374"
/// address : "Dhaka Mirpur"
/// device_token : "eBRFMVKcNkr2ghHu1vT2FV:APA91bFAH7k3BmR6VLsqypmvALu9rZyETwyTh0ghY-3fnoyq1msAJTdq8Z6wbx_ifBcbVjXdD-7c0oYErS8xtMBoUHZVEAfVXuow3MR-2t6qAgw5CI7SGVTZdyvfzvcSXBezi2JrlXfd"
/// created_at : "2023-06-12T17:12:17.000000Z"
/// updated_at : "2023-07-27T16:21:31.000000Z"

class Customer {
  Customer({
      num? customerId, 
      String? fullName, 
      String? email, 
      String? phone, 
      String? address, 
      String? deviceToken, 
      String? createdAt, 
      String? updatedAt,}){
    _customerId = customerId;
    _fullName = fullName;
    _email = email;
    _phone = phone;
    _address = address;
    _deviceToken = deviceToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Customer.fromJson(dynamic json) {
    _customerId = json['customer_id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _deviceToken = json['device_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _customerId;
  String? _fullName;
  String? _email;
  String? _phone;
  String? _address;
  String? _deviceToken;
  String? _createdAt;
  String? _updatedAt;
Customer copyWith({  num? customerId,
  String? fullName,
  String? email,
  String? phone,
  String? address,
  String? deviceToken,
  String? createdAt,
  String? updatedAt,
}) => Customer(  customerId: customerId ?? _customerId,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  phone: phone ?? _phone,
  address: address ?? _address,
  deviceToken: deviceToken ?? _deviceToken,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get customerId => _customerId;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;
  String? get deviceToken => _deviceToken;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = _customerId;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    map['device_token'] = _deviceToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// order_details_id : 292
/// order_id : 162
/// product_name_id : 2
/// amount : "11.99000"
/// quantity : 4

class OrderDetails {
  OrderDetails({
      num? orderDetailsId, 
      num? orderId, 
      num? productNameId, 
      String? amount, 
      num? quantity,}){
    _orderDetailsId = orderDetailsId;
    _orderId = orderId;
    _productNameId = productNameId;
    _amount = amount;
    _quantity = quantity;
}

  OrderDetails.fromJson(dynamic json) {
    _orderDetailsId = json['order_details_id'];
    _orderId = json['order_id'];
    _productNameId = json['product_name_id'];
    _amount = json['amount'];
    _quantity = json['quantity'];
  }
  num? _orderDetailsId;
  num? _orderId;
  num? _productNameId;
  String? _amount;
  num? _quantity;
OrderDetails copyWith({  num? orderDetailsId,
  num? orderId,
  num? productNameId,
  String? amount,
  num? quantity,
}) => OrderDetails(  orderDetailsId: orderDetailsId ?? _orderDetailsId,
  orderId: orderId ?? _orderId,
  productNameId: productNameId ?? _productNameId,
  amount: amount ?? _amount,
  quantity: quantity ?? _quantity,
);
  num? get orderDetailsId => _orderDetailsId;
  num? get orderId => _orderId;
  num? get productNameId => _productNameId;
  String? get amount => _amount;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_details_id'] = _orderDetailsId;
    map['order_id'] = _orderId;
    map['product_name_id'] = _productNameId;
    map['amount'] = _amount;
    map['quantity'] = _quantity;
    return map;
  }

}