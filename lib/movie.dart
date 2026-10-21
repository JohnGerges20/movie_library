
class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(
    title: 'The Lion King',
    genre: 'Animation',
    year: 1994,
    rating: 8.5,
    image: 'assets/posters/lion_king.jpg',
  ),
  Movie(
    title: 'Frozen',
    genre: 'Animation',
    year: 2013,
    rating: 7.4,
    image: 'assets/posters/frozen.jpg',
  ),
  Movie(
    title: 'Tangled',
    genre: 'Animation',
    year: 2010,
    rating: 7.7,
    image: 'assets/posters/tangled.jpg',
  ),
  Movie(
    title: 'Moana',
    genre: 'Animation',
    year: 2016,
    rating: 7.6,
    image: 'assets/posters/moana.jpg',
  ),
  Movie(
    title: 'Zootopia',
    genre: 'Animation',
    year: 2016,
    rating: 8.0,
    image: 'assets/posters/zootopia.jpg',
  ),
  Movie(
    title: 'Encanto',
    genre: 'Animation',
    year: 2021,
    rating: 7.2,
    image: 'assets/posters/encanto.jpg',
  ),
  Movie(
    title: 'Toy Story',
    genre: 'Animation',
    year: 1995,
    rating: 8.3,
    image: 'assets/posters/toy_story.jpg',
  ),

  Movie(
    title: 'Finding Nemo',
    genre: 'Animation',
    year: 2003,
    rating: 8.2,
    image: 'assets/posters/finding_nemo.jpg',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action / Crime',
    year: 2008,
    rating: 9.0,
    image: 'assets/posters/dark_knight.jpg',
  ),
  Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi',
    year: 2014,
    rating: 8.7,
    image: 'assets/posters/interstellar.jpg',
  ),
  Movie(
    title: 'The Conjuring',
    genre: 'Horror',
    year: 2013,
    rating: 7.5,
    image: 'assets/posters/conjuring.jpg',
  ),
  Movie(
    title: 'The Shawshank Redemption',
    genre: 'Drama',
    year: 1994,
    rating: 9.3,
    image: 'assets/posters/shawshank_redemption.jpg',
  ),
  Movie(
    title: 'Inception',
    genre: 'Sci-Fi / Thriller',
    year: 2010,
    rating: 8.8,
    image: 'assets/posters/inception.jpg',
  ),
  Movie(
    title: 'Titanic',
    genre: 'Romance / Drama',
    year: 1997,
    rating: 7.9,
    image: 'assets/posters/titanic.jpg',
  ),
  Movie(
    title: 'Jumanji: Welcome to the Jungle',
    genre: 'Adventure',
    year: 2017,
    rating: 6.9,
    image: 'assets/posters/jumanji.jpg',
  ),
  Movie(
    title: 'The Hangover',
    genre: 'Comedy',
    year: 2009,
    rating: 7.7,
    image: 'assets/posters/hangover.jpg',
  ),
];

