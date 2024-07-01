class Order {
  final String orderId;
  final String timestamp;
  final List<OrderItem> items;
  final CustomerInfo customerInfo;
  final String paymentMode;

  Order({
    required this.orderId,
    required this.timestamp,
    required this.items,
    required this.customerInfo,
    required this.paymentMode,
  });
}

class OrderItem {
  final String title;
  final int quantity;
  final int price;

  OrderItem({
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class CustomerInfo {
  final String name;
  final String phoneNumber;
  final String address;

  CustomerInfo({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });
}
