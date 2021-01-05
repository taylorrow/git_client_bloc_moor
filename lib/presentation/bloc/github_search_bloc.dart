import 'dart:async';
import 'package:git_client_bloc_moor/use_cases/load_all_users_list_from_db.dart';
import 'package:git_client_bloc_moor/use_cases/load_data_from_git_to_moor.dart';
import 'package:git_client_bloc_moor/use_cases/load_data_from_github.dart';
import 'package:git_client_bloc_moor/use_cases/search_by_login_in_db.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'github_search_event.dart';
import 'github_search_state.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final LoadAllUsersListFromDB loadAllUsersListFromDB;
  final SearchByLoginInDB searchByLoginInDB;
  final LoadDataFromGithub loadDataFromGithub;
  final LoadDataFromGitToMoor loadDataFromGitToMoor;

  GithubSearchBloc(
      {@required this.loadAllUsersListFromDB,
      this.searchByLoginInDB,
      this.loadDataFromGithub,
      this.loadDataFromGitToMoor});

  @override
  void onTransition(
      Transition<GithubSearchEvent, GithubSearchState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  GithubSearchState get initialState => SearchStateEmpty();

  @override
  Stream<GithubSearchState> mapEventToState(
    GithubSearchEvent event,
  ) async* {
    if (event is LoadDataFromGit) {
      yield SearchStateLoading();
      try {
        // await database.deleteAllEntries();
        final resultsListFromGithub = await loadDataFromGithub.loadData();
        await loadDataFromGitToMoor.sendDataToMoor(resultsListFromGithub);
        yield LoadDataToDBStateSuccess();
      } catch (error) {
        yield SearchStateError('something went wrong');
      }
    }
    if (event is LoadDataFromDB) {
      yield SearchStateLoading();
      try {
        final resultsListFromDB = await loadAllUsersListFromDB.allUsers;
        yield LoadDataFromDBStateSuccess(resultsListFromDB);
      } catch (error) {
        yield SearchStateError('something went wrong');
      }
    }
    if (event is TextChanged) {
      final String searchLogin = event.text;
      if (searchLogin.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await searchByLoginInDB.userByLogin(searchLogin);
          yield SearchStateSuccess(results);
        } catch (error) {
          yield SearchStateError('something went wrong');
        }
      }
    }
  }
}
