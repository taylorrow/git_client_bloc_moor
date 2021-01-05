import 'package:git_client_bloc_moor/data/moor/moor_database.dart';

class LoadAllUsersListFromDB {
  Future<List<GitUsersTableData>> get allUsers => database.allEntries;
}
