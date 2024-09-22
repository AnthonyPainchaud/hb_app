import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hb_app/widgets/custom_button.dart';
import 'package:intl/intl.dart';

/// Le menu principal de l'application.
///
/// Cette page affiche le logo, un message de bienvenue, la date actuelle,
/// et six boutons non fonctionnel. Les trois premiers boutons sont activés,
/// tandis que les trois derniers sont désactivés.
class MainMenu extends StatelessWidget {
  /// Crée un widget [MainMenu].
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // Ajoute le corps de la page. Cela contient 6 CustomButton, les trois premiers sont activés,
      // les trois derniers sont désactivés.
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 22),
                // Ajoute le logo
                SvgPicture.asset(
                  'assets/images/hb_logo.svg',
                  height: 90,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                // Ajoute le texte de bienvenue et la date actuelle
                Column(
                  children: [
                    Text('Bonjour Serge', style: theme.textTheme.headlineLarge),
                    Text(
                      'Bienvenue sur l\'application!',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                        toBeginningOfSentenceCase(
                            DateFormat('EEEE d MMMM yyyy', 'fr')
                                .format(DateTime.now()))!,
                        style: theme.textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 36),
                // Ajoute les boutons
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    CustomButton(
                      icon: Icons.mark_unread_chat_alt_outlined,
                      text: 'Incidents',
                      onPressed: () {
                        // Action pour le bouton Accueil
                      },
                    ),
                    CustomButton(
                      icon: Icons.my_location_outlined,
                      text: 'Lieu',
                      onPressed: () {
                        // Action pour le bouton Recherche
                      },
                    ),
                    CustomButton(
                      icon: Icons.visibility_outlined,
                      text: 'État actuel',
                      onPressed: () {
                        // Action pour le bouton Paramètres
                      },
                    ),
                    const CustomButton(
                      icon: Icons.verified_user_outlined,
                      text: 'Sûreté',
                      onPressed: null, // Désactivé
                    ),
                    const CustomButton(
                      icon: Icons.construction,
                      text: 'Installation',
                      onPressed: null, // Désactivé
                    ),
                    const CustomButton(
                      icon: Icons.fact_check_outlined,
                      text: 'Maintenance',
                      onPressed: null, // Désactivé
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
