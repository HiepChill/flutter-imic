import 'package:first_project/btap8/api.dart';
import 'package:first_project/btap8/modules/movie.dart';
import 'package:flutter/foundation.dart';

class MovieProvider extends ChangeNotifier {
  final MovieAPI api;

  MovieProvider(this.api);

  MovieResponse? popularMovieResponse;
  MovieResponse? topRatedMovieResponse;

  Future<void> getPopularMovie() async {
    popularMovieResponse = (await api.getPopularMovies());
    notifyListeners();
  }

  Future<void> getTopRatedMovie() async {
    topRatedMovieResponse = (await api.getTopRatedMovies());
    notifyListeners();
  }
}
