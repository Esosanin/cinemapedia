import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





// Este repositorio es inmutable
// Provider(() => null,) == Solo lectura
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation( ActorMoviedbDatasource() );
});





