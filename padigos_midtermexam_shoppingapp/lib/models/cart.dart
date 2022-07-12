class Cart {
  String id;
  String userId;
  DateTime? date;

  List<dynamic>? products;

  Cart({this.id = '', this.userId = '', this.date, this.products});

  factory Cart.fromJson(Map<String, dynamic> item) {
    return Cart(
      id: item['id'].toString(),
      userId: item['userId'].toString(),
      date: DateTime.parse(item['date']),
      products: item['products'],
    );
  }
}
