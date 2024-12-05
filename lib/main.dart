import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/theme.dart';
import 'tabs.dart';
import 'model/user.dart';
import 'model/coffee.dart';
import 'model/history.dart';
import 'model/cart.dart';
import 'model/redeemable.dart';
import 'screen/home.dart';
import 'screen/reward.dart';
import 'screen/my_order.dart';
import 'state/tab_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => CoffeeModel()),
        ChangeNotifierProvider(create: (_) => TabManager()),
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => HistoryModel()),
        ChangeNotifierProvider(create: (_) => RedeemableModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return MaterialApp(
      title: 'Coffee App',
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light, // Switch theme based on the themeNotifier
      home: const Tabs(
        screens: [
          Home(),
          Reward(),
          MyOrder(),
        ],
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF324A59), // Primary color
      colorScheme: const ColorScheme(
        primary: Color(0xFF324A59), // Primary color
        onPrimary: Colors.white, // Primary text color
        secondary: Color(0xFFF7F8FB), // Secondary color
        onSecondary: Color(0xFFD8D8D8), // Secondary text color
        tertiary: Color(0xFFE2FFE8),
        onTertiary: Color(0xFF32B751),
        error: Color(0xFFFFE5E5), // Error color
        onError: Color(0xFFFF3030), // Error text color
        surface: Colors.white, // Surface color
        surfaceDim: Color(0xFF98A4AC),
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
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF324A59), // Primary color
      colorScheme: const ColorScheme(
        primary: Color(0xFF324A59), // Primary color
        onPrimary: Colors.white, // Primary text color
        secondary: Color(0xFF212121), // Dark background color
        onSecondary: Color(0xFFB0B0B0), // Secondary text color
        tertiary: Color(0xFF004D40), // Accent color
        onTertiary: Color(0xFFC8E6C9),
        error: Color(0xFFFFB4B4), // Error color
        onError: Color(0xFFFF5252), // Error text color
        surface: Color(0xFF121212), // Surface color for dark theme
        surfaceDim: Color(0xFF333333), // Dimmed surface color
        onSurface: Color(0xFFE0E0E0), // On surface text color
        outline: Color(0xFF616161),
        brightness: Brightness.dark, // Set theme to dark mode
      ),
      textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 14, color: Colors.white),
          titleMedium: TextStyle(fontSize: 16, color: Colors.white),
          titleLarge: TextStyle(fontSize: 18, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 22, color: Colors.white)),
      shadowColor: Colors.black.withOpacity(0.12),
    );
  }
}
