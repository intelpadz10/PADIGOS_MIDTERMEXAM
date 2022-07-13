import 'package:http/http.dart' as http;
import 'package:padigos_midtermexam_shoppingapp/models/cart.dart';
import 'package:padigos_midtermexam_shoppingapp/models/cart_update.dart';
import 'package:padigos_midtermexam_shoppingapp/models/product.dart';
import 'dart:convert' as convert;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  //login
  Future login(String username, String password) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(Uri.parse(baseUrl), body: body);
    return response.body;
  }

  //productDetails
  Future<List<Product>> getAllProducts() async {
    final products = <Product>[];
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body);
      for (var item in jsonData) {
        products.add(Product.fromJson(item));
      }
      return products;
    }
    return products;
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));
    final jsonData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Product.fromJson(jsonData);
    }
    return Product.fromJson(jsonData);
  }

  //cart
  Future<Cart?> getCart(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/carts/$userId'));
    final jsonData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Cart.fromJson(jsonData);
    }
    return Cart.fromJson(jsonData);
  }

  Future<void> deleteCart(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/carts/$id'));
    final jsonData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonData);
    }
  }

  //categories
  Future<List<String>> getAllCategories() async {
    final categories = <String>[];
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body);
      for (var item in jsonData) {
        categories.add(item);
      }
      return categories;
    }
    return categories;
  }

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    final product = <Product>[];
    final response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body);
      for (var item in jsonData) {
        if (item['category'] == categoryName) {
          product.add(Product.fromJson(item));
        }
      }
      return product;
    }
    return product;
  }

  Future<void> updateCart(int cartId, int productId) async {
    final cartUpdate =
        CartUpdate(userId: cartId, date: DateTime.now(), products: [
      {'productId': productId, 'quantity': 1}
    ]);

    final headers = {
      'Content-type': 'application/json',
    };

    final response = await http.put(Uri.parse('$baseUrl/carts/$cartId'),
        headers: headers, body: convert.jsonEncode(cartUpdate.toJson()));
    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body);
      print(response.statusCode);
      print(jsonData);
    }
  }
}
