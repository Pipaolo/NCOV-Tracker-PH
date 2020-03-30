part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchSuccess extends SearchState {
  final List<City> searchResults;
  SearchSuccess({
    this.searchResults,
  });
  @override
  List<Object> get props => [searchResults];
}

class SearchError extends SearchState {
  final String errorText;
  SearchError({
    this.errorText,
  });
  @override
  List<Object> get props => [errorText];
}
