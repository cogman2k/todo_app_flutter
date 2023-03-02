import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Map colorTheme;
  final Function searchFilter;

  const SearchWidget(
      {super.key, required this.colorTheme, required this.searchFilter});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: colorTheme['secondColor'],
            borderRadius: BorderRadius.circular(20)),
        child: TextField(
          onChanged: (value) {
            searchFilter(value);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: colorTheme['mainColor']),
              border: InputBorder.none,
              hintText: 'Search todo',
              hintStyle: TextStyle(color: colorTheme['mainColor'])),
          style: TextStyle(fontSize: 18, color: colorTheme['mainColor']),
        ));
  }
}
