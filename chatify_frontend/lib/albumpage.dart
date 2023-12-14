import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'track.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key, required this.setPage, required this.currentAlbumID});

  final Function setPage;
  final int currentAlbumID;
  final host = 'http://10.0.2.2:3000'; // using android emulator!

  @override
  Widget build(BuildContext context) {
    var testlink = '${host}/api/getalbumtracks?album=${currentAlbumID}';
    Future<List<Track>> fetchTracksFromAlbum() async {
      try {
        final res = await http.get(Uri.parse(testlink));
        final reqSuccess = res.statusCode == 200;

        if (reqSuccess) {
          print(res.body);
          var trackJson = jsonDecode(res.body)["rows"] as List<dynamic>;
          return trackJson.map((response) {
            return Track(
                trackID: response["TrackID"],
                title: response["Title"],
                releaseDate: response["ReleaseDate"],
                genre: response["Genre"],
                albumID: response["AlbumID"],
                trackNo: response["TrackNo"]);
          }).toList();
        } else {
          throw Exception("reqSuccess is invalid.");
        }
      } catch (error) {
        throw Exception(error);
      }
    }
    return ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  setPage(0);
                },
                child: Text("Back")),
                Column(
                  children: [
                    FutureBuilder(
                      future: fetchTracksFromAlbum(),
                      builder: (context, response) {
                        if (response.hasData) {
                          return Column(
                            children: [
                              for (var track in response.data!)
                              Text(track.title),
                            ],
                          );
                        } else {
                          return Text(response.toString());
                        }
                      }),
                  ],
                ),
            // Container(
            //   width: MediaQuery.of(context).size.width / 2.5,
            //   height: MediaQuery.of(context).size.width / 2.5,
            //   child: Image.network(album.coverImgLink, fit: BoxFit.cover),
            // ),
          ],
        );
  }
}
// }