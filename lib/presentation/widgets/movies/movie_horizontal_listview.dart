import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String title;
  final String subTitle;
  final VoidCallback? loadNextPage;


  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    required this.title, 
    required this.subTitle, 
    this.loadNextPage 
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      height: 385,
      child: Column(
        children: [
          _TitleSubtitle(title: title, color: color, subTitle: subTitle),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final movie = movies[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            movie.posterPath,
                            fit: BoxFit.cover,
                            width: 150,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress != null) {
                                return Center(child: CircularProgressIndicator());
                              }
                              return FadeInRight(child: child);
                            },
                          )
                        )
                      ),
                      SizedBox(
                        width: 130,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(movie.title,maxLines: 2),
                        )
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_half_rounded,color: Colors.amber,),
                          Text(movie.voteAverage.toStringAsFixed(1)),
                          SizedBox(width: 10),
                          Text(movie.voteCount.toString())
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _TitleSubtitle extends StatelessWidget {
  const _TitleSubtitle({
    required this.title,
    required this.color,
    required this.subTitle,
  });

  final String title;
  final ColorScheme color;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, color: color.primary)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text(subTitle, style: TextStyle(color: color.primary)))
        ],
      ),
    );
  }
}