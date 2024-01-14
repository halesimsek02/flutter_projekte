import 'package:flutter/material.dart';
import 'package:japan_event/components/button.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:japan_event/models/cart_models.dart';
import 'package:provider/provider.dart';

class FertigPage extends StatelessWidget {
  const FertigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        backgroundColor:
            isDarkMode ? Colors.black : Color.fromARGB(255, 223, 223, 223),
        appBar: AppBar(
          title: Text(
            "M A K E R S P A C E",
            style: TextStyle(
              color:
                  isDarkMode ? Colors.white : Color.fromARGB(255, 23, 54, 92),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Vielen Dank für eure Bestellung!",
                style: TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Assuming that you have a list of CartItem in your cartModel
            // Update the code according to your data structure
            for (var item in cartModel.items)
              ListTile(
                title: Text(item.itemName),
                subtitle: Text('Quantity: ${item.quantity}'),
              ),
            SizedBox(height: 20),
            MyButton(
              mytext: "Zurück zur Startseite",
              event: () {
                // Hier kannst du die Logik hinzufügen, um den Warenkorb zu leeren, wenn du zurück zur Startseite gehst.
                cartModel.clearAllItems();
                Navigator.pushNamed(context, '/startpage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
