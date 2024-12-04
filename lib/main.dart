import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tabs.dart';
import 'model/user.dart';
import 'model/coffee.dart';
import 'model/cart.dart';
import 'screen/home.dart';
import 'screen/detail.dart';
import 'state/tab_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => CoffeeModel()),
        ChangeNotifierProvider(create: (_) => TabManager()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        primaryColor: const Color(0xFF324A59), // Primary color
        colorScheme: const ColorScheme(
          primary: Color(0xFF324A59), // Primary color
          onPrimary: Colors.white, // Primary text color
          secondary: Color(0xFFF7F8FB), // Secondary color
          onSecondary: Color(0xFFD8D8D8), // Secondary text color
          error: Color(0xFFFFE5E5), // Warning color
          onError: Color(0xFFFF3030), // Default on error color
          surface: Colors.white, // Surface color
          onSurface: Color(0xFF001833), // On surface text color
          outline: Color(0xFFEFEFEF),
          brightness: Brightness.light, // Brightness of the theme
        ),
        textTheme: const TextTheme(
            titleSmall: TextStyle(fontSize: 14),
            titleMedium: TextStyle(fontSize: 16),
            titleLarge: TextStyle(fontSize: 18),
            headlineSmall: TextStyle(fontSize: 22)),
        shadowColor: Colors.black.withOpacity(0.12),
      ),
      home: const Tabs(
        screens: [
          Home(),
          Home(),
          Home(),
        ],
      ),
    );
  }
}
