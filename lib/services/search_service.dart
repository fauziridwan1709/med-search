import 'package:dio/dio.dart';
import 'package:medsearch/entities/search_result.dart';

class SearchService {
  // returns top-10
  static Future<List<SearchResult>> getDocs(String query) async {
    final dio =
        Dio(BaseOptions(baseUrl: 'https://good-med-search-api.herokuapp.com'));
    final result = await dio.get('/search', queryParameters: {'q': query});
    final list = result.data as List<dynamic>;
    final searchResults = <SearchResult>[];
    for (final data in list) {
      searchResults.add(SearchResult(text: data));
    }
    return searchResults;
  }

  static Future<String> getDoc(String doc) async {
    final dio =
        Dio(BaseOptions(baseUrl: 'https://good-med-search-api.herokuapp.com'));
    final result = await dio.get('/$doc');
    final text = result.data as String;
    return text;
  }
}
