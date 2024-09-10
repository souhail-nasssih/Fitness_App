import 'package:fitness_app/pages/components/cardCoach.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  // Liste fictive de profils
  final List<Map<String, dynamic>> profiles = const [
    {
      'name': 'Valentin J.',
      'price': 53,
      'duration': '50 min',
      'description':
          'Apprenez le français efficacement avec un passionné de langues étrangères.',
      'languages': 'Français (Natif), Anglais (C2), +2',
      'image': 'images/5.jpg',
    },
    {
      'name': 'Marie P.',
      'price': 45,
      'duration': '45 min',
      'description':
          'Améliorez votre français avec une professeure expérimentée.',
      'languages': 'Français (Natif), Espagnol (B2), +1',
      'image': 'images/5.jpg',
    },
    {
      'name': 'Jean D.',
      'price': 60,
      'duration': '60 min',
      'description': 'Cours de français pour tous les niveaux.',
      'languages': 'Français (Natif), Anglais (C1)',
      'image': 'images/5.jpg',
    },
    {
      'name': 'Jean D.',
      'price': 60,
      'duration': '60 min',
      'description': 'Cours de français pour tous les niveaux.',
      'languages': 'Français (Natif), Anglais (C1)',
      'image': 'images/5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        return ProfileCard(
          name: profiles[index]['name'],
          price: profiles[index]['price'], // Ici, c'est un int, pas un double
          duration: profiles[index]['duration'],
          description: profiles[index]['description'],
          languages: profiles[index]['languages'],
          image: profiles[index]['image'],
        );
      },
    );
  }
}
