import 'package:flutter/material.dart';
import 'package:medsearch/router.dart';
import 'package:medsearch/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const SizedBox(
                height: 20,
              ),
              SearchBar(
                controller: _searchTextController,
                onSearchSubmit: () {
                  final isValid = _formKey.currentState?.validate();
                  if (isValid ?? false) {
                    goRouter.goNamed(
                      'search-page',
                      queryParams: {'q': _searchTextController.text},
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
