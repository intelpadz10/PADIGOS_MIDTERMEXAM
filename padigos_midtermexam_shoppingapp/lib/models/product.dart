class Product {
  int? id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> item) {
    return Product(
      id: item['id'],
      title: item['title'],
      price: item['price'],
      category: item['category'],
      description: item['description'],
      image: item['image'],
    );
  }
}
