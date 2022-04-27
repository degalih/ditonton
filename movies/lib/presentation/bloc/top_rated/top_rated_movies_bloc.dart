import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';

import '../../../domain/entities/movie.dart';

part 'top_rated_movies_event.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMoviesBloc(this._getTopRatedMovies) : super(MoviesEmpty()) {
    on<FetchTopRatedMovies>((event, emit) async {
      emit(MoviesLoading());

      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(
          MoviesHasData(data),
        ),
      );
    });
  }
}
