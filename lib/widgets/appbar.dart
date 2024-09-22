import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Un AppBar personnalisé pour l'application.
///
/// Cet AppBar contient un logo et un bouton de déconnexion.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  /// Crée un widget [CustomAppBar].
  ///
  /// Le constructeur initialise la taille préférée de l'AppBar.
  const CustomAppBar({super.key}) : preferredSize = const Size.fromHeight(68.5);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      // correspondre la taille préférée du preferredSize
      toolbarHeight: 68.5,
      // désactive la couleur default du fond
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.colorScheme.onPrimary,
      shadowColor: theme.shadowColor,
      elevation: 5,
      // ajoute une bordure autour de l'AppBar
      shape: Border.all(
        color: theme.colorScheme.tertiary,
        width: 3.5,
      ),
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SvgPicture.asset(
            'assets/images/hb_logo.svg',
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Action pour le bouton de déconnexion
          },
        ),
      ],
    );
  }
}
