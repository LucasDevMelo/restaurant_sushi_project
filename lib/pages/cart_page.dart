import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_sushi_project/theme/colors.dart';
import 'package:restaurant_sushi_project/models/shop.dart';

import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remiver do carrinho
  void removeFromCart(){}

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) =>  Scaffold(
      appBar: AppBar(
        title: const Text("Meu carrinho"),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: value.cart.length,
          itemBuilder: (context, index){
            // pegar do carrinho
            final Food food = value.cart[index];

            // pegar nome da comida
            final String foodName = food.name;

            // pegar preço da comida
            final String foodPrice = food.price;

            //retornar titulo da comida
            return Container(
              decoration: BoxDecoration(color: secondaryColor),
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: ListTile(
                title: Text(foodName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                subtitle: Text(foodPrice),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: removeFromCart,
                ),
              ),
            );
          }
      ),
    ),);
  }
}
