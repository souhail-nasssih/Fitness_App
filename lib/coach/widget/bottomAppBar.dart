import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges; // Alias pour éviter les conflits

class ProfessionalBottomAppBar extends StatefulWidget {
  final int emailCount; // Nombre d'e-mails
  final int notificationCount; // Nombre de notifications

  const ProfessionalBottomAppBar({
    super.key,
    this.emailCount = 2,
    this.notificationCount = 5,
  });

  @override
  _ProfessionalBottomAppBarState createState() =>
      _ProfessionalBottomAppBarState();
}

class _ProfessionalBottomAppBarState extends State<ProfessionalBottomAppBar> {
  late int emailCount;
  late int notificationCount;
  final int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    emailCount = widget.emailCount;
    notificationCount = widget.notificationCount;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white, // Couleur de fond de la BottomAppBar
      elevation: 8.0, // Ombre pour donner de la profondeur
      child: Row(
        children: [
          // Espacement à gauche avec badge pour les e-mails
          _buildIconButton(
            context,
            Icons.email,
            'Notifications',
            '/notifications',
            emailCount,
            
          ),
          _buildIconButton(
            context,
            Icons.notifications,
            'Alerts',
            '/alerts',
            notificationCount,
          ),

          Expanded(
            child: Center(
              child: Container(
                width: 60, // Largeur du bouton Home
                height: 60, // Hauteur du bouton Home
                decoration: BoxDecoration(
                  color: Colors.indigo, // Couleur de fond du bouton Home
                  shape: BoxShape.circle, // Forme circulaire
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ),
          ),

          // Espacement à droite sans badge
          _buildIconButton(
            context,
            Icons.person,
            'Profile',
            '/profile',
            null, // Pas de badge pour Profile
          ),
          _buildIconButton(
            context,
            Icons.settings,
            'Settings',
            '/settings',
            null, // Pas de badge pour Settings
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    String tooltip,
    String route,
    int? badgeCount, // badgeCount est maintenant nullable
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: badgeCount != null && badgeCount > 0
          ? badges.Badge(
              badgeContent: Text(
                '$badgeCount',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
                elevation: 0,
              ),
              position: badges.BadgePosition.topEnd(top: 0, end: 0),
              child: IconButton(
                icon: Icon(icon, color: Colors.indigo),
                tooltip: tooltip,
                onPressed: () {
                  Navigator.pushNamed(context, route);
                },
              ),
            )
          : IconButton(
              icon: Icon(icon, color: Colors.indigo),
              tooltip: tooltip,
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
            ),
    );
  }
}
