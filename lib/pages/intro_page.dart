import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_sushi_project/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 28, 26),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //nome do restaurante
            Text(
              "SUSHILAND",
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 25),

            // ícone
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi2.png'),
            ),

            const SizedBox(height: 25),

            //titulo
            Text(
              "A casa da comida japonesa",
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 44,
              ),
            ),

            const SizedBox(height: 10),


            //botao de iniciar
            MyButton(text: "Iniciar",
            onTap: () {
              //ir ao menu
              Navigator.pushNamed(context, '/menupage');
            },)
            
          ],
        ),
      ),
    );
  }
}
