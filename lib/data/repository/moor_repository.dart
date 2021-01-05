import 'package:git_client_bloc_moor/data/model/search_result.dart';
import 'package:git_client_bloc_moor/data/moor/moor_database.dart';
import 'github_repository.dart';

class MoorRepository {
  final GithubRepository repository = GithubRepository();

  sendDataToMoor(SearchResult result) async {
    await database.addAllEntries(result);
  }
}
