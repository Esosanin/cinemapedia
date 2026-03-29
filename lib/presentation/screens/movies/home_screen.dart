import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {

  const _HomeView();

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch( initialLoadingProvider );
    if( initialLoading ) return const FullScreenLoader();


    final slideShowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );

    /**
     * Puedes utilizar un widget llamado "Visibility" y usar la opción "visible" por
     * si no quieres utilizar el widget "FullScreenLoader"
     * * Solo aparecera cuando el provider "initialLoading" sea "true"
     */

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
            
                MoviesSlideshow( movies: slideShowMovies ),
            
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage()
                ),
            
                MoviesHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Proximamente', 
                  subTitle: 'En este mes',
                  loadNextPage: () => ref.read( upcomingMoviesProvider.notifier ).loadNextPage()
                ),
            
                MoviesHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  //subTitle: '',
                  loadNextPage: () => ref.read( popularMoviesProvider.notifier ).loadNextPage()
                ),
            
                MoviesHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subTitle: 'Desde siempre',
                  loadNextPage: () => ref.read( topRatedMoviesProvider.notifier ).loadNextPage()
                ),

                const SizedBox(height: 50,)
              ],
            );
          },
          childCount: 1
        )),


      ]
    );
  }
}