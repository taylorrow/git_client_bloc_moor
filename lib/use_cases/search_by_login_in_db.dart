import 'package:git_client_bloc_moor/data/moor/moor_database.dart';

class SearchByLoginInDB {
  Future <List<GitUsersTableData>> userByLogin(String login) {
    return database.entryByLogin(login);
  }
}
