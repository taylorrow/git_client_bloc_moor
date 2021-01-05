import 'package:git_client_bloc_moor/data/model/search_result.dart';
import 'package:git_client_bloc_moor/data/repository/moor_repository.dart';

class LoadDataFromGitToMoor {
  final MoorRepository repository = MoorRepository();

  sendDataToMoor(SearchResult result) async {
    await repository.sendDataToMoor(result);
  }
}
