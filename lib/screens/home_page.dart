import 'package:flutter/material.dart';
import 'package:hb_app/screens/main_menu.dart';
import 'package:hb_app/widgets/appbar.dart';
import 'package:hb_app/widgets/navbar.dart';

/// Le page d'accueil de l'application.
///
/// Cette page affiche un AppBar personnalisé, un corps de page qui change
/// en fonction de l'index de la page sélectionnée, et une barre de navigation
/// en bas de l'écran.
class HomePage extends StatefulWidget {
  /// Crée un widget [HomePage]
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// Le state associé au widget [HomePage].
class _HomePageState extends State<HomePage> {
  /// L'index de la page actuellement sélectionnée.
  int selectedPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedPageIndex) {
      case 1:
        page = const MainMenu();
        break;
      default:
        page = const Placeholder();
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: page,
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedPageIndex: selectedPageIndex,
          onPressed: (index) {
            setState(() {
              selectedPageIndex = index;
            });
          }),
    );
  }
}
