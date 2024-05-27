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
  // Navegar para detalhes do sushi
  void navigateToFoodDetails(int index) {
    // Pegar a compra e menu
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
    // Pegar a compra e menu
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
          // Botão carrinho
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de promoções
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Mensagem
                  Column(
                    children: [
                      Text(
                        '32% de desconto',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botão de resgate
                      MyButton(
                        text: 'Resgatar',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiscountPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Imagem
                  Image.asset(
                    'lib/images/sushi (4).png',
                    height: 80,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Barra de pesquisa
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
                  hintText: 'Pesquisar...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.white,
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
            // Lista horizontal de itens populares
            SizedBox(
              height: 243, // Defina a altura desejada para a lista horizontal
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),
            const SizedBox(height: 25),
            // Título do Cardápio
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
            const SizedBox(height: 10),
            // Lista vertical de itens do cardápio
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Impedir que rolem independentemente
              shrinkWrap: true, // Deixe a lista encolher para caber no conteúdo visível
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => navigateToFoodDetails(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Imagem
                      Image.asset(
                        foodMenu[index].imagePath,
                        height: 60,
                      ),
                      const SizedBox(width: 20),
                      // Nome e preço
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nome
                          Text(
                            foodMenu[index].name,
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          // Preço
                          Text(
                            foodMenu[index].price,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
