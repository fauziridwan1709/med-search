import 'package:go_router/go_router.dart';
import 'package:medsearch/pages/home_page.dart';
import 'package:medsearch/pages/search_page.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home-page',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/search',
    name: 'search-page',
    builder: (context, state) => SearchPage(
      initialQuery: state.queryParams['q'],
    ),
  ),
]);
