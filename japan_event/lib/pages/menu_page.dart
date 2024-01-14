import 'package:flutter/material.dart';
import 'package:japan_event/components/button.dart';
import 'package:japan_event/components/event_tile.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;
    List EventList = [
      EventTile(
        name: "3D-Drucker",
        imagePath: "lib/images/3d_drucker2.2.png",
        rating: "5",
        details: () => Navigator.pushNamed(context, '/festivalpage'),
      ),
      EventTile(
        name: "3D-Scan",
        imagePath: "lib/images/3d_scan.png",
        rating: "3.8",
        details: () => Navigator.pushNamed(context, '/scanPage'),
      ),
      EventTile(
        name: "Textil Labor",
        imagePath: "lib/images/textil2.png",
        rating: "4",
        details: () => Navigator.pushNamed(context, '/textilPage'),
      ),
      EventTile(
        name: "Lasercutting",
        imagePath: "lib/images/laser.jpg",
        rating: "4.3",
        details: () => Navigator.pushNamed(context, '/lasercuttingPage'),
      ),
    ];

    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        title: Text(
          "M A K E R S P A C E",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Color.fromARGB(255, 23, 54, 92),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: isDarkMode ? Colors.white : Color.fromARGB(255, 23, 54, 92),
        ),
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
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color:
                    isDarkMode ? Colors.white : Color.fromARGB(255, 23, 54, 92),
              ),
              onPressed: () => Navigator.pushNamed(context, '/cartpage'),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 23, 54, 92),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Montags bis 18 Uhr!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 141, 174, 37),
                      ),
                    ),
                    SizedBox(height: 15),
                    MyButton(
                      mytext: "Buchen",
                      event: () {
                        Navigator.pushNamed(context, '/scanPage');
                      },
                    )
                  ],
                ),
                Image.asset(
                  "lib/images/3d_scan.png",
                  height: 135,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Suche Bereich",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 141, 174, 37),
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 141, 174, 37), width: 3.5),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 141, 174, 37)),
                ),
              ),
            ),
          ),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Bereiche und Ausstattungen",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 141, 174, 37)),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => EventList[index],
              itemCount: EventList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Der Zeit Beliebt",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 141, 174, 37)),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 23, 54, 92),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "lib/images/textil2.png",
                  height: 115,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Textil Labor",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 141, 174, 37)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      mytext: "Sofort Buchen",
                      event: () {
                        Navigator.pushNamed(context, '/textilPage');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
