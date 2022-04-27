import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';

import '../../../domain/entities/movie.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies _getPopularMovies;

  PopularMoviesBloc(this._getPopularMovies) : super(MoviesEmpty()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(MoviesLoading());

      final result = await _getPopularMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(
          MoviesHasData(data),
        ),
      );
    });
  }
}
