import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';


final actorByMovieProvider = StateNotifierProvider<ActorMapNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch( actorsRepositoryProvider );
  return ActorMapNotifier( getActors: actorsRepository.getActorsByMovie );
});

// ignore: slash_for_doc_comments
/**
 * {
 *  '505642': <Actor>[],
 *  '505643': <Actor>[],
 *  '505644': <Actor>[],
 *  '505645': <Actor>[],
 * }
 */

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorMapNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallback getActors;

  ActorMapNotifier({
    required this.getActors,
  }): super({});

  Future<void> loadActors( String movieId ) async {
    if( state[movieId] != null ) return;
    
    final List<Actor> actors = await getActors( movieId );
    state = { ...state, movieId: actors };
  }
}