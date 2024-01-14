import 'package:flutter/material.dart';
import 'package:japan_event/components/button.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:japan_event/models/cart_models.dart';
import 'package:provider/provider.dart';

class lasercuttingPage extends StatefulWidget {
  const lasercuttingPage({Key? key}) : super(key: key);

  @override
  _LasercuttingPage createState() => _LasercuttingPage();
}

class _LasercuttingPage extends State<lasercuttingPage> {
  bool hasTraining = false;
  int bookingCount = 0;

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
                "lib/images/laser.jpg",
                height: 200,
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Lasercutting",
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
                "Mit unseren Lasercutter kannst Du eine Vielzahl von Materialien präzise und schnell zuschneiden und/oder gravieren. Die Lichtenergie des Lasers wird beim Kontakt mit der Oberfläche zu Wärmeenergie. Diese erhitzt das Material so stark, dass es verdampft oder verbrennt und auf diese Weise abgetragen werden kann. So können in kurzer Zeit präzise Umrisse oder reliefartige Gravuren geschnitten werden.",
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
            // Zeige die Anzahl der Buchungen basierend auf der Benutzerantwort
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
                        // Füge die Buchungen für 3D-Druck zum Warenkorb hinzu
                        cartModel.addBuchungLaser(bookingCount);
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
                        // Füge die Buchungen für 3D-Scan zum Warenkorb hinzu
                        cartModel.addSchulungLaser(bookingCount);
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
              ),
          ],
        ),
      ),
    );
  }
}
