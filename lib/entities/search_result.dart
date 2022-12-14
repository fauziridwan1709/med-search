class SearchResult {
  SearchResult({
    required this.text,
  });
  String text;

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(text: json['text']);
  }
}
