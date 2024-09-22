import 'package:flutter/material.dart';
import 'package:hb_app/screens/home_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hb_app/theme/theme.dart';

/// Point d'entrée principal pour l'application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HB App',
      theme: defaultTheme,
      home: const HomePage(),
    );
  }
}