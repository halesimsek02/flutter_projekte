import 'package:flutter/material.dart';
import 'package:japan_event/components/button.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:japan_event/models/cart_models.dart';
import 'package:provider/provider.dart';

class festivalPage extends StatefulWidget {
  const festivalPage({Key? key}) : super(key: key);

  @override
  _FestivalPageState createState() => _FestivalPageState();
}

class _FestivalPageState extends State<festivalPage> {
  bool hasTraining = false;
  int bookingCount = 0;
  int trainingCount = 0;

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
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<DarkModeProvider>(context, listen: false)
                    .toggleDarkMode();
              },
              icon: isDarkMode
                  ? Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    )
                  : Icon(Icons.dark_mode, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/cartpage');
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "lib/images/3d_drucker2.2.png",
                height: 200,
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "3D-Drucker",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Das erwartet Sie",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Beim Kunststoff-Schmelzschichtungs-Verfahren (FDM) wird Kunststoff, der zumeist aufgerollt in Drahtform bereitgestellt wird (Filament), erhitzt und durch eine Düse auf eine Bauplattform aufgetragen. Der Druck des zuvor am Computer erstellten 3D-Objekts erfolgt dabei Schicht für Schicht in gedruckten Bahnen. FDM-Druck eignet sich besonders für die Fertigung von 3D-Körpern in geringer Stückzahl, Leichtbauteilen und komplexen Geometrien.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 23, 54, 92),
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ich habe schon die Schulung",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 23, 54, 92),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            hasTraining = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 23, 54, 92), // Hintergrundfarbe
                        ),
                        child: Text("Ja"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            hasTraining = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 23, 54, 92), // Hintergrundfarbe
                        ),
                        child: Text("Nein"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Zeige die Anzahl der Buchungen oder Schulungen basierend auf der Benutzerantwort
            if (hasTraining)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "Anzahl der Buchungen:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 23, 54, 92),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              bookingCount++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                                255, 23, 54, 92), // Hintergrundfarbe
                          ),
                          child: Icon(Icons.add),
                        ),
                        Text(
                          bookingCount.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 54, 92),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (bookingCount > 0) {
                                bookingCount--;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                                255, 23, 54, 92), // Hintergrundfarbe
                          ),
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      mytext: "Zum Warenkorb",
                      event: () {
                        // Füge die Buchungen zum Warenkorb hinzu
                        cartModel.addBuchungDruck(bookingCount);
                        // Zurücksetzen der Zählvariable
                        setState(() {
                          bookingCount = 0;
                        });
                        // Navigiere zur Warenkorbseite
                        Navigator.pushNamed(context, '/cartpage');
                      },
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "Anzahl der Schulungen:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 23, 54, 92),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              trainingCount++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                                255, 23, 54, 92), // Hintergrundfarbe
                          ),
                          child: Icon(Icons.add),
                        ),
                        Text(
                          trainingCount.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 54, 92),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (trainingCount > 0) {
                                trainingCount--;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                                255, 23, 54, 92), // Hintergrundfarbe
                          ),
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      mytext: "Zum Warenkorb",
                      event: () {
                        // Füge die Schulungen zum Warenkorb hinzu
                        cartModel.addSchulungDruck(trainingCount);
                        // Zurücksetzen der Zählvariable
                        setState(() {
                          trainingCount = 0;
                        });
                        // Navigiere zur Warenkorbseite
                        Navigator.pushNamed(context, '/cartpage');
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
