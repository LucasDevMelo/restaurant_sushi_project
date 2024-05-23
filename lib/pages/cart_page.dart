import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_sushi_project/components/button.dart';
import 'package:restaurant_sushi_project/theme/colors.dart';
import 'package:restaurant_sushi_project/models/shop.dart';
import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remover do carrinho
  void removeFromCart(Food food, BuildContext context){
    //obter acesso a compra
    final shop = context.read<Shop>();

    //remover do carrinho
    shop.removeFromCart(food);

  }

  // //valor total
  // void valorTotal (){
    
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) =>  Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Meu carrinho", style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          //itens do carrinho
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
              itemCount: value.cart.length,
                itemBuilder: (context, index){
                  // pegar do carrinho
                  final Food food = value.cart[index];

                  //pegar imagem da comida
                  final String imagePath = food.imagePath;

                  // pegar nome da comida
                  final String foodName = food.name;

                  // pegar preço da comida
                  final String foodPrice = food.price;

                  //retornar titulo da comida
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
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text("Valor total:",
                      style: TextStyle(color: Colors.white),),
                    ),

            ),
          ),



          //Botao de compra
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
                text: "Finalizar compra",
                onTap: (){},
            ),
          )
        ],
      ),
    ),);
  }
}
