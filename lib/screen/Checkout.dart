import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

typedef void PaymentSuccessCallback();

class Checkout extends StatelessWidget {
  final PaymentSuccessCallback? onSuccess;

  const Checkout({Key? key, this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Consumer<ShoppingCart>(
        builder: (context, cart, child) {
          if (cart.cart.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No items to checkout'),
                  TextButton(
                    child: const Text("Go back to Product Catalog"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/products");
                    },
                  ),
                ],
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Item Details"),
                Expanded(child: getItems(context)),
                const Divider(height: 4, color: Colors.black),
                getTotal(), // Total text placed here
                ElevatedButton(
                  onPressed: () {
                    cart.removeAll();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Payment Successful'),
                      ),
                    );
                    onSuccess?.call();
                  },
                  child: const Text("Pay Now!"),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget getTotal() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total Cost to Pay: ${cart.cartTotal}");
    });
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Text('No Items yet!')
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.food_bank),
                title: Text(products[index].name),
                trailing: Text("${products[index].price}"),
              );
            },
          );
  }
}
