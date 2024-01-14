import 'package:flutter/material.dart';
import 'package:japan_event/components/button.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:japan_event/models/cart_models.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void dispose() {
    Provider.of<CartModel>(context, listen: false).clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : Color.fromARGB(255, 223, 223, 223),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Text(
                "Maker Space",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Center(
            child: Image.asset(
              "lib/images/makerspacelogo.png",
              height: 350,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Willkommen im Maker Space...",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 54, 92)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "…dem kreativsten Ort auf Mark 51°7!",
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 54, 92)),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: MyButton(
              mytext: "Reise Starten",
              event: () {
                Provider.of<CartModel>(context, listen: false).clearAll();
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          )
        ]),
      ),
    );
  }
}
