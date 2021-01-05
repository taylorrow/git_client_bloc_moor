class SearchResultItem {
  final String login;
  final String htmlUrl;
  final String avatarUrl;

  const SearchResultItem({this.login, this.avatarUrl, this.htmlUrl});

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      login: json['login'] as String,
      htmlUrl: json['html_url'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }
}
