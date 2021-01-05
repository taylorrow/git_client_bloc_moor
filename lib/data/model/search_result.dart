import 'search_result_item.dart';

class SearchResult {
  final List<SearchResultItem> items;

  const SearchResult({this.items});

  static SearchResult fromJson(List<dynamic> json) {
    final List<SearchResultItem> items = [];
    json.forEach((element) {
      items.add(SearchResultItem.fromJson(element));
    });
    return SearchResult(items: items);
  }
}
