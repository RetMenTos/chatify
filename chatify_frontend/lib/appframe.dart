import 'package:flutter/material.dart';
import 'bottomnavbar.dart';
import 'homepage.dart';
import 'searchpage.dart';
import 'albumpage.dart';

class AppFrame extends StatefulWidget {
  const AppFrame({super.key});

  @override
  State<AppFrame> createState() => _AppFrameState();
}

class _AppFrameState extends State<AppFrame> {
  int currentPageIndex = 0;
  int currentAlbumID = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(setPage: _setPage),
      body: <Widget>[
        HomePage(openAlbum: _openAlbum),
        SearchPage(),
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Library",
                  style: Theme.of(context).textTheme.titleLarge!),
            ),
            const Placeholder(),
          ],
        )),
        AlbumPage(setPage: _setPage, currentAlbumID: currentAlbumID),
      ][currentPageIndex],
    );
  }

  void _setPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void _openAlbum(int index) {
    setState(() {
      currentPageIndex = 3;
      currentAlbumID = index;
    });
  }
}
