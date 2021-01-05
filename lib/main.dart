import 'package:flutter/material.dart';
import 'presentation/bloc/github_search_bloc.dart';
import 'presentation/ui/search_form.dart';
import 'use_cases/load_all_users_list_from_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'use_cases/load_data_from_git_to_moor.dart';
import 'use_cases/load_data_from_github.dart';
import 'use_cases/search_by_login_in_db.dart';

void main() {
  final LoadAllUsersListFromDB _loadAllUsersListFromDB =
      LoadAllUsersListFromDB();
  final SearchByLoginInDB _searchByLoginInDB = SearchByLoginInDB();
  final LoadDataFromGithub _loadDataFromGithub = LoadDataFromGithub();
  final LoadDataFromGitToMoor _loadDataFromGitToMoor = LoadDataFromGitToMoor();
  runApp(App(
      loadAllUsersListFromDB: _loadAllUsersListFromDB,
      searchByLoginInDB: _searchByLoginInDB,
      loadDataFromGithub: _loadDataFromGithub,
      loadDataFromGitToMoor: _loadDataFromGitToMoor));
}

class App extends StatelessWidget {
  final LoadAllUsersListFromDB loadAllUsersListFromDB;
  final SearchByLoginInDB searchByLoginInDB;
  final LoadDataFromGithub loadDataFromGithub;
  final LoadDataFromGitToMoor loadDataFromGitToMoor;

  const App(
      {Key key,
      @required this.loadAllUsersListFromDB,
      this.searchByLoginInDB,
      this.loadDataFromGithub,
      this.loadDataFromGitToMoor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      home: Scaffold(
        appBar: AppBar(title: Text('git_client_bloc_moor')),
        body: BlocProvider(
          create: (context) => GithubSearchBloc(
              loadAllUsersListFromDB: loadAllUsersListFromDB,
              searchByLoginInDB: searchByLoginInDB,
          loadDataFromGithub: loadDataFromGithub,
          loadDataFromGitToMoor: loadDataFromGitToMoor),
          child: SearchForm(),
        ),
      ),
    );
  }
}
