import 'package:equatable/equatable.dart';

abstract class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();

  @override
  List<Object> get props => [];
}
class LoadDataFromGit extends GithubSearchEvent {}
class LoadDataFromDB extends GithubSearchEvent {}

class TextChanged extends GithubSearchEvent {
  final String text;

  const TextChanged({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
