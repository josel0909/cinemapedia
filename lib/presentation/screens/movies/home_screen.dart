import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Home Screen')
        ),
      ),
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator()
      );
    }


    return Scaffold(
      body: ListView.separated(
        itemCount: nowPlayingMovies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = nowPlayingMovies[index];
          return ListTile(
            leading: Image.network(movie.posterPath),
            title: Text(movie.title),
          );
        }, separatorBuilder: (BuildContext context, int index) { 
          return SizedBox(height: 10,);
         },
      ),
    );
  }
}