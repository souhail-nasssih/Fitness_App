import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final int price; // Déclaré en tant qu'int
  final String duration;
  final String description;
  final String languages;
  final String image;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.price,
    required this.duration,
    required this.description,
    required this.languages,
    required this.image,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isFavorite = false; // Déclaré comme un booléen

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder pour l'image
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey
                      .shade300, // Arrière-plan gris pour l'image manquante
                  child: Image.asset(widget.image, width: 80, height: 80),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: Icon(
                    isFavorite
                        ? Icons.star
                        : Icons.star_border, // Changement de l'icône
                    color: isFavorite
                        ? Colors.yellow[900]
                        : Colors.black, // Couleur de l'icône
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite; // Inverser l'état favori
                    });
                    print(isFavorite
                        ? "Ajouté aux favoris"
                        : "Retiré des favoris");
                  },
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Informations sur le profil
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Prix et durée
                  Text(
                    '${widget.price} \$US - Cours de ${widget.duration}', // Ici, price est utilisé comme un int
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Langues parlées
                  Text(
                    'Parle : ${widget.languages}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
