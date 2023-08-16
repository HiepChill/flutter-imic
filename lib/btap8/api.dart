import 'package:dio/dio.dart';
import 'package:first_project/btap8/modules/movie.dart';

class MovieAPI {
  final Dio dio;

  MovieAPI(this.dio);
  Future<MovieResponse> getPopularMovies() async {
    final response =
        await dio.get<Map<String, dynamic>>('/popular?language=en-US&page=1');
    return MovieResponse.fromJson(response.data!);
  }

  Future<MovieResponse> getTopRatedMovies() async {
    final response =
        await dio.get<Map<String, dynamic>>('/top_rated?language=en-US&page=1');
    return MovieResponse.fromJson(response.data!);
  }
}
