import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/search_result.dart';
import 'model/search_result_error.dart';

class GithubClient {
  final String baseUrl;
  final http.Client httpClient;

  GithubClient({
    http.Client httpClient,
    this.baseUrl = "https://api.github.com/users",
  }) : this.httpClient = httpClient ?? http.Client();

  Future<SearchResult> fetchData() async {
    final response = await httpClient.get(Uri.parse("$baseUrl"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
