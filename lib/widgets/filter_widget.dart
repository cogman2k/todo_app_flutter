import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final Map colorTheme;
  final Function changeFilter;
  final String filter;
  const FilterWidget(
      {super.key,
      required this.colorTheme,
      required this.changeFilter,
      required this.filter});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70,
              height: filter == 'All' ? 50 : 40,
              decoration: BoxDecoration(
                  color: filter == 'All' ? Colors.green[500] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () => changeFilter('All'),
                  child: const Text('All',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
            Container(
              width: 70,
              height: filter == 'Doing' ? 50 : 40,
              decoration: BoxDecoration(
                color: filter == 'Doing' ? Colors.green[500] : Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                  onPressed: () => changeFilter('Doing'),
                  child: const Text('Doing',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
            Container(
              width: 70,
              height: filter == 'Done' ? 50 : 40,
              decoration: BoxDecoration(
                color: filter == 'Done' ? Colors.green[500] : Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                  onPressed: () => changeFilter('Done'),
                  child: const Text('Done',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
          ],
        ));
  }
}
