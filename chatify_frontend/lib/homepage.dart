import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'album.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  final host = 'http://10.0.2.2:3000'; // using android emulator!

  @override
  Widget build(BuildContext context) {
    var testlink = '${host}/api/getalbums';
    Future<List<Album>> fetchAlbums() async {
      try {
        final res = await http.get(Uri.parse(testlink));
        final reqSuccess = res.statusCode == 200;

        if (reqSuccess) {
          var albumJson = jsonDecode(res.body)["rows"] as List<dynamic>;
          return albumJson.map((response) {
            return Album(
                title: response["Title"],
                artist: response["Artist"],
                coverImgLink: response["CoverImgLink"],
                releaseDate: response["ReleaseDate"],
                genre: response["Genre"]);
          }).toList();
        } else {
          throw Exception("reqSuccess is invalid.");
        }
      } catch (error) {
        throw Exception(error);
      }
    }

    var placeholderUsername = "William";
    var placeholderInfo = {
      {
        "image-url":
            "https://images.unsplash.com/photo-1599693596422-48940f0b4880?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Soul Funk",
        "type": "Album",
        "artist": "John",
      },
      {
        "image-url":
            "https://images.unsplash.com/photo-1490042307672-2f36f88d9c7b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w3NjMyMzgwNnx8ZW58MHx8fHx8",
        "name": "Letterbox",
        "type": "Single",
        "artist": "Bill",
      },
      {
        "image-url":
            "https://images.unsplash.com/photo-1581970560075-c0f568d76d0f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXw3NjMyMzgwNnx8ZW58MHx8fHx8",
        "name": "Something Blue",
        "type": "EP",
        "artist": "Matt",
      },
    };
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Container(
            child: Text(
              "Welcome, ${placeholderUsername}",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "Popular Now",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.width / 2.5 + 100,
            child: FutureBuilder(
                future: fetchAlbums(),
                builder: (context, response) {
                  if (response.hasData) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var album in response.data!)
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 10, right: 10),
                            child: Column(children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.width / 2.5,
                                child: Image.network(album.coverImgLink,
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(height: 10),
                              Text(album.title),
                              Text("Album by ${album.artist}"),
                              const SizedBox(height: 10),
                            ]),
                          ),
                      ],
                    );
                  } else {
                    return Text("error");
                  }
                }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "Your Favourites",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.width / 2.5 + 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var item in placeholderInfo)
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.width / 2.5,
                        child: Image.network(item['image-url']!,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 10),
                      Text(item['name']!),
                      Text("${item['type']!} by ${item['artist']!}"),
                      const SizedBox(height: 10),
                    ]),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "We Recommend",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.width / 2.5 + 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var item in placeholderInfo)
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.width / 2.5,
                        child: Image.network(item['image-url']!,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 10),
                      Text(item['name']!),
                      Text("${item['type']!} by ${item['artist']!}"),
                      const SizedBox(height: 10),
                    ]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
