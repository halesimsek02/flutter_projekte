import 'package:flutter/material.dart';
import 'package:japan_event/components/button.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:japan_event/models/cart_models.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
          backgroundColor:
              isDarkMode ? Colors.black : Color.fromARGB(255, 223, 223, 223),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Warenkorb",
              style: TextStyle(
                color: Color.fromARGB(255, 141, 174, 37),
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    SizedBox(height: 15),
// Anzeige für 3D-Druck Schulungen
                    if (cartModel.schulungDruck > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "3D-Druck Schulung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.schulungDruck.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeSchulungDruck,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addDruckSchulung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearSchulungDruck,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    // Anzeige für 3D-Druck Nutzung
                    if (cartModel.buchungDruck > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "3D-Druck Nutzung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.buchungDruck.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeBuchungDruck,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addDruckBuchung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearBuchungDruck,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
// Anzeige für 3D-Scan Schulungen
                    if (cartModel.schulungScan > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "3D Scan Schulung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.schulungScan.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeSchulungScan,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addScanSchulung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearSchulungScan,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    // Anzeige für 3D Scan Nutzung
                    if (cartModel.buchungScan > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "3D Scan Nutzung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.buchungScan.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeBuchungScan,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addScanBuchung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearBuchungScan,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    // Anzeige für Textil Labor Schulungen
                    if (cartModel.schulungTextil > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "Textil Labor Schulung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.schulungTextil.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeSchulungTextil,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addTextilSchulung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearSchulungTextil,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    // Anzeige für Textil Labor Nutzung
                    if (cartModel.buchungTextil > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "Textil Labor Nutzung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.buchungTextil.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeBuchungTextil,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addTextilBuchung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearBuchungTextil,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    // Anzeige für Lasercutting Schulungen
                    if (cartModel.schulungLaser > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "Lasercutting Schulung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.schulungLaser.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeSchulungLaser,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addLaserSchulung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearSchulungLaser,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    // Anzeige für Lasercutting Nutzung
                    if (cartModel.buchungLaser > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 54, 92),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            "Lasercutting Nutzung",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 174, 37)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.buchungLaser.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 141, 174, 37)),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: cartModel.removeBuchungLaser,
                                  icon: Icon(Icons.remove,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              IconButton(
                                  onPressed: cartModel.addLaserBuchung,
                                  icon: Icon(Icons.add,
                                      color:
                                          Color.fromARGB(255, 141, 174, 37))),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: cartModel.clearBuchungLaser,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 23, 54, 92),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          "Menge der gesamt Buchungen und Schulungen",
                          style: TextStyle(
                              color: Color.fromARGB(255, 141, 174, 37)),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              cartModel.totalItems.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 141, 174, 37)),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                                onPressed: cartModel.clearAll,
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 141, 174, 37),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    MyButton(
                      mytext: "Bestellung abschließen",
                      event: () {
                        Navigator.pushNamed(context, '/fertigPage');
                      },
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
