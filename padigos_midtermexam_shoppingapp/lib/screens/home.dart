import 'package:flutter/material.dart';
import 'package:padigos_midtermexam_shoppingapp/models/product.dart';
import 'package:padigos_midtermexam_shoppingapp/screens/all_category.dart';
import 'package:padigos_midtermexam_shoppingapp/screens/cart_screen.dart';
import 'package:padigos_midtermexam_shoppingapp/screens/product_detail.dart';
import 'package:padigos_midtermexam_shoppingapp/service/api_service.dart';
import 'package:padigos_midtermexam_shoppingapp/service_locators.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ApiService service = locator<ApiService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.view_list),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllCategoryScreen()),
              ),
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(),
                ),
              ),
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
            future: service.getAllProducts(),
            builder: (_, AsyncSnapshot<List<Product>> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final products = snapshot.data!;
              return ListView.separated(
                separatorBuilder: (_, __) => const Divider(thickness: 1),
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  final product = snapshot.data![index];
                  return ListTile(
                    title: Text(product.title!),
                    leading: Image.network(
                      product.image!,
                      height: 50,
                      width: 50,
                    ),
                    subtitle: Text('\$${product.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(id: index+1),
                        ),
                      );
                    },
                  );
                }),
              );
            }),
      ),
    );
  }
}
