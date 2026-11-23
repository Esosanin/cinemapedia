import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch( movieRepositoryProvider );
  return MovieMapNotifier( getMovie: movieRepository.getMovieById );
});

// ignore: slash_for_doc_comments
/**
 * {
 *  '505642': Movie(),
 *  '505643': Movie(),
 *  '505644': Movie(),
 *  '505645': Movie(),
 * }
 */

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }): super({});

  Future<void> loadMovie( String movieId ) async {
    if( state[movieId] != null ) return;
    print(' Realizando petición HTTP ');
    final movie = await getMovie( movieId );

    state = { ...state, movieId: movie };
  }
}