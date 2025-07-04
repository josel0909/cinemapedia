import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/enviroment.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/dataSources/movies_datasource.dart';

class MoviedbDatasource extends MoviesDatasource {

  final http = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      headers: {
        'Authorization': 'Bearer ${Enviroment.movieDbKey}'
      },
      queryParameters: {
        'language': 'es-MX'
      }
    )
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final res = await http.get('/movie/now_playing');
    final movieDbRes = MovieDbResponse.fromJson(res.data);

    final List<Movie> movies = movieDbRes.results.map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)).toList();
    
    return movies;
  }
}