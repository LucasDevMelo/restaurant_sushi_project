import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier{

  //cardápio
  final List<Food> _foodMenu = [
    //Salmão
    Food(
      name: "Salmão",
      price: "R\$ 21.00",
      imagePath: "lib/images/sushi (5).png",
      rating: "4.9",
      description: "Deliciosas fatias de salmão fresco caem elegantemente sobre uma almofada de arroz de sushi perfeitamente temperado",
    ),

    //Manga
    Food(
      name: "Manga",
      price: "R\$ 19.50",
      imagePath: "lib/images/sushi (6).png",
      rating: "4.5",
      description: "O sushi consiste em um pedaço cilíndrico fino de arroz e manga enrolado com alga Nori por fora.",
    ),

    //Uramaki
    Food(
      name: "Uramaki",
      price: "R\$ 20.50",
      imagePath: "lib/images/uramaki.png",
      rating: "4.5",
      description: "Conhecido como sushi invertido, ele traz o gohan (arroz japonês) por fora e a alga por dentro.",
    ),

    Food(
      name: "California",
      price: "R\$ 22.50",
      imagePath: "lib/images/california.png",
      rating: "4.4",
      description: "Ele é composto por arroz de sushi, que é arroz de grão curto temperado com vinagre de arroz, açúcar e sal, e uma folha de alga nori que envolve o arroz e os recheios. ",
    ),

    Food(
      name: "Salmão Cream Cheese",
      price: "R\$ 23.80",
      imagePath: "lib/images/salmaocreemcheese.png",
      rating: "4.1",
      description: "Este sushi é composto por arroz de sushi, que é arroz de grão curto temperado com vinagre de arroz, açúcar e sal, e uma folha de alga nori que envolve o arroz e os recheios. ",
    ),

    Food(
      name: "Vegetariano",
      price: "R\$ 19.50",
      imagePath: "lib/images/vegetariano.png",
      rating: "3.9",
      description: "Este tipo de sushi é composto por arroz de sushi, que é arroz de grão curto temperado com vinagre de arroz, açúcar e sal, e uma folha de alga nori que envolve o arroz e os recheios. ",
    ),
  ];

  //customer cart
  List<Food> _cart = [];

  //gether methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //Adicionar ao carrinho
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //Remover do carrinho
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}