import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: ( moviedb.backdropPath != '' ) 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://previews.123rf.com/images/macrovector/macrovector1806/macrovector180600296/102746545-glitch-style-poster-with-404-not-found-text-on-screen-with-destruction-pixels-structure-background.jpg',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: ( moviedb.posterPath != '')
      ? moviedb.posterPath
      : 'no-poster',
      //: 'https://previews.123rf.com/images/macrovector/macrovector1806/macrovector180600296/102746545-glitch-style-poster-with-404-not-found-text-on-screen-with-destruction-pixels-structure-background.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
