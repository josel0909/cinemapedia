import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return SafeArea(
      top: true,
      bottom: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: color.primary,),
              SizedBox(width: 5,),
              Text('Cinemapedia',style: TextStyle(color: color.primary, fontSize: 18),),
              Spacer(),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.search_rounded)
              )
            ],
          ),
        ),
      )
    );
  }
}