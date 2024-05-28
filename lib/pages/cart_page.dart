import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_sushi_project/components/button.dart';
import 'package:restaurant_sushi_project/theme/colors.dart';
import 'package:restaurant_sushi_project/models/shop.dart';
import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remover do carrinho
  void removeFromCart(Food food, BuildContext context) {
    // Obter acesso à compra
    final shop = context.read<Shop>();

    // Remover do carrinho
    shop.removeFromCart(food);
  }

  // Função para calcular o valor total
  double calculateTotal(List<Food> cart) {
    double total = 0.0;
    for (var food in cart) {
      // Converter o preço de string para double
      double price = double.tryParse(food.price.replaceAll('R\$ ', '')) ?? 0.0;
      total += price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) => Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Meu carrinho", style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Itens do carrinho
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // Pegar do carrinho
                  final Food food = value.cart[index];

                  // Pegar imagem da comida
                  final String imagePath = food.imagePath;

                  // Pegar nome da comida
                  final String foodName = food.name;

                  // Pegar preço da comida
                  final String foodPrice = food.price;

                  // Retornar título da comida
                  return Container(
                    decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      leading: Image.asset(imagePath),
                      title: Text(foodName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      subtitle: Text(foodPrice, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeFromCart(food, context),
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                }
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(left: 0, top: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valor Total',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'R\$ ${calculateTotal(value.cart).toStringAsFixed(2)}',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botão de compra
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
              text: "Finalizar compra",
              onTap: () {},
            ),
          )
        ],
      ),
    ));
  }
}
