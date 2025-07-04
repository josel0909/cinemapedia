
import 'package:cinemapedia/infraestructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_respository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//esto es de solo lectura
//para que puedan consultar lo que hay en moviedbdatasource
final movieRepositoryProvider = Provider((ref){

  return MovieRespositoryImp(MoviedbDatasource());
});