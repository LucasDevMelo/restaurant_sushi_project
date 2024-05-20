import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_sushi_project/components/button.dart';
import 'package:restaurant_sushi_project/theme/colors.dart';
import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  //quantidade
  int quantityCount = 0;

  //diminuir quantidade
  void decrementQuantity(){
    setState(() {
      quantityCount--;
    });
  }

  //aumentar  quantidade
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  //adicionar ao carrinho
  void addToCart(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //detalhes da comida
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //imagem
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  //avaliação
                  Row(
                    children: [
                      //ícone de estrela
                      Icon(Icons.star, color: Colors.yellow[800]),

                      const SizedBox(width: 5),

                      //número de avaliação
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  //nome do prato
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),

                  const SizedBox(height: 25),

                  //descrição
                  Text(
                    "Descrição",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Deliciosos fatias de salmão fresco caem elegantemente sobre uma almofada de arroz de sushi perfeitamente temperado",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //preço + quantidade + adicionar ao carrinho
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //preço + quantidade
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //preço
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    //quantidade
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        //Botao de quanidade
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        //Botao de adicionar
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                
                //adicionar ao carrinho
                MyButton(text: "Adicionar ao carrinho", onTap: addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
