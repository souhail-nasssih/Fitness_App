import 'package:fitness_app/coach/widget/bottomAppBar.dart';
import 'package:fitness_app/coach/widget/customCard.dart';
import 'package:flutter/material.dart';

class DashboardCoach1 extends StatefulWidget {
  const DashboardCoach1({super.key});

  @override
  State<DashboardCoach1> createState() => _DashboardCoachState();
}

class _DashboardCoachState extends State<DashboardCoach1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Section en-tête
          Container(
            height: height * 0.25,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.blueGrey.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Welcome, Coach!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Section des cartes avec coins arrondis
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Nombre d'éléments par ligne
                  childAspectRatio: 1.2, // Ratio des éléments
                  mainAxisSpacing: 12, // Espacement entre les rangées
                  crossAxisSpacing: 12, // Espacement entre les colonnes
                ),
                itemCount:
                    5, // Nombre d'éléments dans la grille (ajusté pour 5 cartes)
                itemBuilder: (context, index) {
                  switch (index) {
                    // case 0:
                    //   return CustomCard(
                    //     icon: Icons.chat,
                    //     color: Colors.blueAccent,
                    //     title: 'Chat',
                    //   );
                    case 1:
                      return const CustomCard(
                        icon: Icons.location_on,
                        color: Colors.greenAccent,
                        title: 'Location',
                      );
                    case 2:
                      return const CustomCard(
                        icon: Icons.history,
                        color: Colors.orangeAccent,
                        title: 'History',
                      );
                    case 3:
                      return const CustomCard(
                        icon: Icons.person_add,
                        color: Colors.purpleAccent,
                        title: 'Invitation',
                      );
                    case 0:
                      return const CustomCard(
                        icon: Icons.play_arrow,
                        color: Colors.redAccent,
                        title: 'Playing',
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          const ProfessionalBottomAppBar(), // Utilisez le BottomAppBar ici
    );
  }
}
