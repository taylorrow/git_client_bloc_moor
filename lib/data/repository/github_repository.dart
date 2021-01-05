import '../github_client.dart';
import '../model/search_result.dart';

class GithubRepository {
  final GithubClient client = GithubClient();

  Future<SearchResult> loadData() async {
    final result = await client.fetchData();
    return result;
  }
}
