import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Container(
            child: Text(
              "Search",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SearchBar(
            leading: Icon(Icons.search),
            hintText: "Look for a song...",
            hintStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.bodyLarge),
            padding:
                MaterialStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
            shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 255, 255, 255)),
          ),
          for
        ],
      ),
    );
  }
}
