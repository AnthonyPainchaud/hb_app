import 'package:flutter/material.dart';

/// Un widget de bouton personnalisé qui affiche une icône et du texte en dessous.
///
/// Le widget [CustomButton] est stateless et prend une [icon],
/// un [text], et un callback optionnel [onPressed]. Il utilise le widget
/// [ElevatedButton] pour créer un bouton avec un style personnalisé.
class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  /// Si [onPressed] est null, le bouton sera désactivé.
  final VoidCallback? onPressed;

  /// [icon] et [text] sont obligatoires.
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool disabled = onPressed == null;

    final theme = Theme.of(context);
    return ElevatedButton(
      // Ajouter le style de theme.elevatedButtonTheme.style et aussi ajouter une couleur de fond
      style: theme.elevatedButtonTheme.style!.copyWith(
        // Vérifier si le bouton est désactivé pour display la bonne couleur de fond
        backgroundColor: disabled
            ? WidgetStateProperty.all(theme.colorScheme.surface)
            : WidgetStateProperty.all(theme.colorScheme.onPrimary),
        shadowColor: WidgetStateProperty.all(theme.shadowColor),
        elevation: WidgetStateProperty.all(5),
        fixedSize: WidgetStateProperty.all(const Size(170, 115)),
      ),
      onPressed: onPressed,
      child: Column(
        // Centrer l'icône et le texte
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Si le bouton est désactivé, changer la couleur de l'icône et du texte
          Icon(icon,
              color: disabled
                  ? theme.colorScheme.secondaryFixedDim
                  : theme.colorScheme.secondary,
              size: 45),
          const SizedBox(height: 20),
          Text(text,
              style: disabled
                  ? theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.4))
                  : theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}
