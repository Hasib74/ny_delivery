class FirebaseKey {
  static String USER = "User";

  static String DEVICE_TOKEN = "device_token";

  static String TOKEN = "token";

  static String DRIVER = "driver";

  static String VENDOR = "vendor";

  static String DELIVERY_MAN = "delivery_man";

  static String DELIVERY_MAN_ID = "delivery_man_id";

  static String DELIVERY_MAN_LAT = "delivery_man_lat";

  static String DELIVERY_MAN_LAN = "delivery_man_lng";

  static String ACTIVE_ORDER = "active_order";

  static String ORDER_ID = "order_id";

  static var STATUS = "delivery_status";

  static DeliveryStatus? deliveryStatus;
}

class DeliveryStatus {
  String readyToPickUp = "ready_to_pickup";

  String _ready_to_delivery = "ready_to_delivery";

 //   String get readyToPickUp => _ready_to_pickup;

  String get readyToDelivery => _ready_to_delivery;
}
