import 'package:flutter/material.dart';

class CustomBottomNacigationBar extends StatelessWidget {
  const CustomBottomNacigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_rounded),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_important_rounded),
          label: 'Categorias'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: 'Favoritos'
        )
      ]
    );
  }
}