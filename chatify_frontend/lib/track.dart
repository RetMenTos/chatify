class Track {
  const Track(
      {required this.trackID,
      required this.title,
      required this.releaseDate,
      required this.genre,
      required this.albumID,
      required this.trackNo});

  final int trackID;
  final String title;
  final String releaseDate;
  final String genre;
  final int albumID;
  final int trackNo;
}
