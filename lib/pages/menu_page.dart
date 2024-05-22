import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_sushi_project/components/button.dart';
import 'package:restaurant_sushi_project/components/food_tile.dart';
import 'package:restaurant_sushi_project/models/shop.dart';
import 'package:restaurant_sushi_project/pages/discount_page.dart';
import 'package:restaurant_sushi_project/pages/food_details_page.dart';
import 'package:restaurant_sushi_project/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navegar para detalhes do sushi
  void navigateToFoodDetails(int index) {
    //pegar a compra e menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //pegar a compra e menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.grey[800],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
          ),
          title: Text(
            'Brasília',
            style: TextStyle(color: Colors.grey[900]),
            textAlign: TextAlign.center,
          ),
          actions: [
            //botão carrinho
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartpage');
                },
                icon: const Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //banner de promoções
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mensagem
                  Column(
                    children: [
                      Text(
                        '32% de desconto',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.white),
                      ),

                      const SizedBox(height: 20),

                      //Botao de resgate
                      MyButton(
                          text: 'Resgatar',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiscountPage(),
                              ),
                            );
                          })
                    ],
                  ),
                  //imagem
                  Image.asset(
                    'lib/images/sushi (4).png',
                    height: 80,
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            //barra de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Populares
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Populares",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),

            const SizedBox(height: 45),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Cardápio",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            //cardápio
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  //imagem
                  Image.asset(
                    'lib/images/sushi (4).png',
                    height: 60,
                  ),

                  SizedBox(width: 20),

                  //nome e preço
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //nome
                      Text(
                        "Salmão",
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                      ),
                      const SizedBox(height: 10),

                      //preço
                      Text(
                        '\$21.00',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
