import 'package:git_client_bloc_moor/data/model/search_result.dart';
import 'package:git_client_bloc_moor/data/repository/github_repository.dart';

class LoadDataFromGithub {
  final GithubRepository repository = GithubRepository();

  Future<SearchResult> loadData() async {
    final result = await repository.loadData();
    return result;
  }
}
