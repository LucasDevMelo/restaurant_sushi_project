import 'package:flutter/material.dart';

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
                    height: 100,
                  ),

                  const SizedBox(width: 5),                ],
              )
            ),
          )
        ],
      ),
    );
  }
}