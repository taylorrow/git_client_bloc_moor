import 'package:equatable/equatable.dart';
import 'package:git_client_bloc_moor/data/moor/moor_database.dart';

abstract class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

class LoadDataToDBStateSuccess extends GithubSearchState {}

class LoadDataFromDBStateSuccess extends GithubSearchState {
  final List<GitUsersTableData> items;

  const LoadDataFromDBStateSuccess(this.items);
}

class SearchStateEmpty extends GithubSearchState {}

class SearchStateLoading extends GithubSearchState {}

class SearchStateSuccess extends GithubSearchState {
  final List<GitUsersTableData> items;

  const SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends GithubSearchState {
  final String error;

  const SearchStateError(this.error);

  @override
  List<Object> get props => [error];
}
