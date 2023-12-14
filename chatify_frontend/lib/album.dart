class Album {
  const Album(
      {required this.albumID,
      required this.title,
      required this.artist,
      required this.coverImgLink,
      required this.releaseDate,
      required this.genre});

  final int albumID;
  final String title;
  final String artist;
  final String coverImgLink;
  final String releaseDate;
  final String genre;
}
