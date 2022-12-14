import 'package:flutter/material.dart';
import 'package:medsearch/router.dart';
import 'package:medsearch/services/search_service.dart';
import 'package:medsearch/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    this.initialQuery,
  }) : super(key: key);

  final String? initialQuery;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery != null) {
      _searchTextController.text = widget.initialQuery!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      children: [
        Row(
          children: [
            Tooltip(
              message: 'Go to med search home',
              child: InkWell(
                onTap: () => goRouter.goNamed('home-page'),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SearchBar(
                controller: _searchTextController,
                onSearchSubmit: () => setState(() {}),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder(
            future: SearchService.getDocs(_searchTextController.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data ?? [];
                return Column(
                  children: data.map((e) {
                    return ListTile(
                      onTap: () {
                        goRouter
                            .goNamed('detail-page', params: {'doc': e.text});
                      },
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        e.text,
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(e.text),
                    );
                  }).toList(),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const SizedBox();
            }),
      ],
    ));
  }
}
