import 'package:flutter/material.dart';
import 'package:medsearch/services/search_service.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final String doc;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset('assets/logo.png'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: SearchService.getDoc(widget.doc),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data ?? 'Empty';
                    return Text(data);
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                }),
          ],
        ),
      ),
    );
  }
}
