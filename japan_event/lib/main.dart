import 'package:flutter/material.dart';
import 'package:japan_event/cart_page.dart';
import 'package:japan_event/dark_mode.dart';
import 'package:japan_event/models/cart_models.dart';
import 'package:japan_event/pages/event_pages/festival.dart';
import 'package:japan_event/pages/event_pages/lasercutting.dart';
import 'package:japan_event/pages/event_pages/scan.dart';
import 'package:japan_event/pages/event_pages/textil.dart';
import 'package:japan_event/pages/fertig.dart';
import 'package:japan_event/pages/menu_page.dart';
import 'package:japan_event/pages/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkModeProvider()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      routes: {
        '/startpage': (context) => StartPage(),
        '/menupage': (context) => MenuPage(),
        '/festivalpage': (context) => festivalPage(),
        '/textilPage': (context) => textilPage(),
        '/cartpage': (context) => CartPage(),
        '/scanPage': (context) => scanPage(),
        '/lasercuttingPage': (context) => lasercuttingPage(),
        '/fertigPage': (context) => FertigPage(),
      },
    );
  }
}
