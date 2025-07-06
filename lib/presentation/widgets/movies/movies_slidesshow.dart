import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesSlidesShow extends StatelessWidget {

  final List<Movie> movies;
  
  const MoviesSlidesShow({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(       
        viewportFraction: 0.8,
        scale: 0.8,
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(top: 1),
          builder: DotSwiperPaginationBuilder(
            color: Colors.black12,
            activeColor: color.primary 
          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _Slide(movie: movies[index]);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10)
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}