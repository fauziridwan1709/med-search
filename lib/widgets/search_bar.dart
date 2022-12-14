import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medsearch/router.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.controller,
    this.onSearchSubmit,
  });
  final TextEditingController controller;
  final VoidCallback? onSearchSubmit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return 'Please input something!';
        }
        return null;
      },
      onFieldSubmitted: (val) => onSearchSubmit?.call(),
      decoration: InputDecoration(
        hintText: 'Search something',
        border: const OutlineInputBorder(),
        suffixIcon: Tooltip(
          message: 'search',
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchSubmit,
          ),
        ),
      ),
    );
  }
}
