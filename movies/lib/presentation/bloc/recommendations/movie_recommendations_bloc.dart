import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';

import '../../../domain/entities/movie.dart';

part 'movie_recommendations_event.dart';

part 'movie_recommendations_state.dart';

class MovieRecommendationsBloc
    extends Bloc<MovieRecommendationsEvent, MovieRecommendationsState> {
  final GetMovieRecommendations _getMovieRecommendations;

  MovieRecommendationsBloc(this._getMovieRecommendations)
      : super(MoviesEmpty()) {
    on<FetchRecommendationMovies>((event, emit) async {
      emit(MoviesLoading());

      final result = await _getMovieRecommendations.execute(event.id);

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(
          MoviesHasData(data),
        ),
      );
    });
  }
}
