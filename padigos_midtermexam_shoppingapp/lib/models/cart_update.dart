class CartUpdate {
  int userId;
  DateTime date;
  List<dynamic> products;
  CartUpdate({
    required this.userId,
    required this.date,
    required this.products,
  });
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "date": date == null ? null : date.toIso8601String(),
      "products": products,
    };
  }

  factory CartUpdate.fromJson(Map<String, dynamic> item) {
    return CartUpdate(
      userId: item['userId'],
      date: DateTime.parse(item['date']),
      products: item['products'],
    );
  }
}
