class NewOrderModel {
  String? success;
  String? statusCode;
  List<Message>? message;

  NewOrderModel({this.success, this.statusCode, this.message});

  NewOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['message'] != null) {
      if (json["message"].toString() == "data not found") {
        message = [];
      }else{
        message =  <Message>[];
        json['message'].forEach((v) {
          message!.add(new Message.fromJson(v));
        });
      }

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? id;
  int? serviceProviderId;
  int? customerId;
  int? deliveryManId;
  String? orderCode;
  var offerId;
  int? orderStatusId;
  int? totalAmount;
  var discount;
  int? deliveryFee;
  int? paidAmount;
  var paymentType;
  String? paymentStatus;
  String? customerPaymentId;
  var orderAddress;
  String? orderDatetime;
  var deliveryDatetime;
  String? orderAcceptTime;
  String? deliveryTime;
  String? itemsPickTime;
  int? distance;
  int? deliverySpeed;
  String? createdAt;
  String? updatedAt;
  int? autoId;
  int? orderId;
  String? notificationTime;
  String? assignedDateTime;
  int? orderStatus;
  String? fullName;
  String? address;
  String? email;
  String? phone;
  String? photo;
  var genderId;
  var countryId;
  var description;
  String? cardNumber;
  String? cardCvc;
  String? latValue;
  String? longValue;
  String? shopName;
  var updatedBy;
  String? vendorImage;
  String? openingAt;
  String? closingAt;
  String? rating;
  var stateId;
  var cityId;
  var zip;
  var deliveryCharge;
  int? isActive;

  Message(
      {this.id,
      this.serviceProviderId,
      this.customerId,
      this.deliveryManId,
      this.orderCode,
      this.offerId,
      this.orderStatusId,
      this.totalAmount,
      this.discount,
      this.deliveryFee,
      this.paidAmount,
      this.paymentType,
      this.paymentStatus,
      this.customerPaymentId,
      this.orderAddress,
      this.orderDatetime,
      this.deliveryDatetime,
      this.orderAcceptTime,
      this.deliveryTime,
      this.itemsPickTime,
      this.distance,
      this.deliverySpeed,
      this.createdAt,
      this.updatedAt,
      this.autoId,
      this.orderId,
      this.notificationTime,
      this.assignedDateTime,
      this.orderStatus,
      this.fullName,
      this.address,
      this.email,
      this.phone,
      this.photo,
      this.genderId,
      this.countryId,
      this.description,
      this.cardNumber,
      this.cardCvc,
      this.latValue,
      this.longValue,
      this.shopName,
      this.updatedBy,
      this.vendorImage,
      this.openingAt,
      this.closingAt,
      this.rating,
      this.stateId,
      this.cityId,
      this.zip,
      this.deliveryCharge,
      this.isActive});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    customerId = json['customer_id'];
    deliveryManId = json['delivery_man_id'];
    orderCode = json['order_code'];
    offerId = json['offer_id'];
    orderStatusId = json['order_status_id'];
    totalAmount = json['total_amount'];
    discount = json['discount'];
    deliveryFee = json['delivery_fee'];
    paidAmount = json['paid_amount'];
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    customerPaymentId = json['customer_payment_id'];
    orderAddress = json['order_address'];
    orderDatetime = json['order_datetime'];
    deliveryDatetime = json['delivery_datetime'];
    orderAcceptTime = json['order_accept_time'];
    deliveryTime = json['delivery_time'];
    itemsPickTime = json['items_pick_time'];
    distance = json['distance'];
    deliverySpeed = json['delivery_speed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    autoId = json['auto_id'];
    orderId = json['order_id'];
    notificationTime = json['notification_time'];
    assignedDateTime = json['assigned_date_time'];
    orderStatus = json['order_status'];
    fullName = json['full_name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    genderId = json['gender_id'];
    countryId = json['country_id'];
    description = json['description'];
    cardNumber = json['card_number'];
    cardCvc = json['card_cvc'];
    latValue = json['lat_value'];
    longValue = json['long_value'];
    shopName = json['shop_name'];
    updatedBy = json['updated_by'];
    vendorImage = json['vendor_image'];
    openingAt = json['opening_at'];
    closingAt = json['closing_at'];
    rating = json['rating'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    zip = json['zip'];
    deliveryCharge = json['delivery_charge'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_provider_id'] = this.serviceProviderId;
    data['customer_id'] = this.customerId;
    data['delivery_man_id'] = this.deliveryManId;
    data['order_code'] = this.orderCode;
    data['offer_id'] = this.offerId;
    data['order_status_id'] = this.orderStatusId;
    data['total_amount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['delivery_fee'] = this.deliveryFee;
    data['paid_amount'] = this.paidAmount;
    data['payment_type'] = this.paymentType;
    data['payment_status'] = this.paymentStatus;
    data['customer_payment_id'] = this.customerPaymentId;
    data['order_address'] = this.orderAddress;
    data['order_datetime'] = this.orderDatetime;
    data['delivery_datetime'] = this.deliveryDatetime;
    data['order_accept_time'] = this.orderAcceptTime;
    data['delivery_time'] = this.deliveryTime;
    data['items_pick_time'] = this.itemsPickTime;
    data['distance'] = this.distance;
    data['delivery_speed'] = this.deliverySpeed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['auto_id'] = this.autoId;
    data['order_id'] = this.orderId;
    data['notification_time'] = this.notificationTime;
    data['assigned_date_time'] = this.assignedDateTime;
    data['order_status'] = this.orderStatus;
    data['full_name'] = this.fullName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['gender_id'] = this.genderId;
    data['country_id'] = this.countryId;
    data['description'] = this.description;
    data['card_number'] = this.cardNumber;
    data['card_cvc'] = this.cardCvc;
    data['lat_value'] = this.latValue;
    data['long_value'] = this.longValue;
    data['shop_name'] = this.shopName;
    data['updated_by'] = this.updatedBy;
    data['vendor_image'] = this.vendorImage;
    data['opening_at'] = this.openingAt;
    data['closing_at'] = this.closingAt;
    data['rating'] = this.rating;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['zip'] = this.zip;
    data['delivery_charge'] = this.deliveryCharge;
    data['is_active'] = this.isActive;
    return data;
  }
}
