import 'package:flutter/material.dart';

/// Une barre de navigation personnalisée pour l'application. Le [BottomNavigationBar] offrait pas
/// assez de flexibilité pour les besoins de l'application, donc cette barre de navigation a été
/// créée pour répondre à ces besoins.
///
/// Cette barre de navigation affiche trois éléments : Accueil, Recherche, et Paramètres.
class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedPageIndex;
  final void Function(int) onPressed;

  /// Crée un widget [CustomBottomNavigationBar].
  ///
  /// Les paramètres [selectedPageIndex] et [onPressed] sont requis.
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedPageIndex,
    required this.onPressed,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

/// Le state associé au widget [CustomBottomNavigationBar].
class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      // Ajoute le background a la nav bar et une ombre
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.3),
            blurRadius: 5,
          ),
        ],
      ),
      // Ajoute les trois éléments de la nav bar
      child: Row(
        children: [
          CustomNavBarItem(
            icon: Icons.search,
            text: 'Recherche',
            isSelected: widget.selectedPageIndex == 0,
            onPressed: () => widget.onPressed(0),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          CustomNavBarItem(
            icon: Icons.home_filled,
            text: 'Acceuil',
            isSelected: widget.selectedPageIndex == 1,
            onPressed: () => widget.onPressed(1),
            borderRadius: BorderRadius.circular(15),
          ),
          CustomNavBarItem(
            icon: Icons.settings,
            text: 'Paramètres',
            isSelected: widget.selectedPageIndex == 2,
            onPressed: () => widget.onPressed(2),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ),
        ],
      ),
    );
  }
}

/// Un élément personnalisé de la barre de navigation.
///
/// Cet élément affiche une icône et du texte en dessous, et peut être sélectionné ou non.
class CustomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  /// Crée un widget [CustomNavBarItem].
  ///
  /// Les paramètres [icon], [text], [isSelected], [onPressed], et [borderRadius] sont requis.
  const CustomNavBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onPressed,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ElevatedButton(
        // change la couleur de fond en fonction de si l'élément est sélectionné ou non
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.onPrimary,
          animationDuration: Duration.zero,
          elevation: 0, // eneleve la bordure
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius, side: BorderSide.none),
        ),
        onPressed: onPressed,
        // ajoute l'icône et le texte. Ceux-ci changent de couleur en fonction de si l'élément est sélectionné ou non
        child: Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: theme.textTheme.bodyMedium!.fontSize,
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface),
              )
            ],
          ),
        ),
      ),
    );
  }
}
