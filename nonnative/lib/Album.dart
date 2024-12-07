class Album
{
  static int currentId = 0;
  late int id;
  String title;
  String artist;
  String rating;
  int release;
  String genre;
  bool listen;

  Album(this.title, this.artist, this.rating, this.release, this.genre, this.listen)
  {
    id = currentId++;
  }

  Album.fromAlbum(this.id, this.title, this.artist, this.rating, this.release, this.genre, this.listen);

  static List<Album> init()
  {
    List<Album> albums =
    [
      Album("The Bravery", "The Bravery", "47", 2005, "Indie Rock, Dance-Punk", true),
      Album("Pleasure to Kill", "Kreator", "88", 1986, "Thrash Metal, Speed Metal", true),
      Album("Franz Ferdinand", "Franz Ferdinand", "71", 2004, "Dance Rock, Indie Rock", true),
      Album("The Slow Rush", "The Slow Rush", "-", 2020, "Rock, Neo-Psychedelic", false),
      Album("Summer In Abaddon", "Pinback", "67", 2004, "Indie Rock, Emo", true),
      Album("War Room Stories", "BretonLabs", "68", 2014, "Indie Pop, Electronic Rock", true),
      Album("Omega", "Epica", "-", 2021, "Gothic Symphonic Metal, Power Metal, Opera Metal", false),
      Album("Veneer", "Jose Gonzalez", "79", 2006, "Indie Folk, Chamber Pop", true),
      Album("Mechanical Bull", "Kings Of Leon", "61", 2013, "Modern Rock, Garage Rock Revival", true),
      Album("Hummingbird", "Local Natives", "-", 2013, "Shimmer Pop, Indie Rock, Chamber Pop", false)
    ];

    return albums;
  }
}