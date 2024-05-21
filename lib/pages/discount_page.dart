import 'package:flutter/material.dart';
import 'package:restaurant_sushi_project/components/button.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DiscountPage> {
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //imagem
                  Image.asset(
                    'lib/images/sushi (4).png',
                    height: 140,
                  ),

                  const SizedBox(height: 55),

                  Text(
                    "Utilize o número do cupom ou QR code abaixo para pegar no restaurante",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),

                  const SizedBox(height: 60),

                  Text(
                    "NÚMERO DO CUPOM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    "2U 4R E",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),

                  Image.asset(
                    'lib/images/qrcode.png',
                    height: 200,
                  ),

                  const SizedBox(height: 95),

                  MyButton(text: "Copiar código", onTap: (){})
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}