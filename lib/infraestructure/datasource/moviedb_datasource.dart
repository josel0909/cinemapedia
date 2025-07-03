import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/domain/dataSources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

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
    final List<Movie> movies = [];
    debugPrint(res.toString());
    
    return movies;
  }
}