
import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  bool isGridView = true;
  int discount = 20;

  final Set<String> bookmarkedMovies = {};

  void toggleBookmark(String movieTitle) {
    setState(() {
      if (bookmarkedMovies.contains(movieTitle)) {
        bookmarkedMovies.remove(movieTitle);
      } else {
        bookmarkedMovies.add(movieTitle);
      }
    });
  }

  void decreaseDiscount() {
    setState(() {
      if (discount > 0) {
        discount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = searchText.toLowerCase().trim();

    final filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();

    final movieCount = filteredMovies.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            tooltip: isGridView ? 'List View' : 'Grid View',
            icon: Icon(
              isGridView ? Icons.view_list : Icons.grid_view,
            ),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchText.trim().isEmpty
                      ? 'All Movies'
                      : 'Search Results',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$movieCount ${movieCount == 1 ? 'movie' : 'movies'}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
              child: Text('No movies found'),
            )
                : isGridView
                ? GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredMovies.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.58,
              ),
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];

                return MovieCard(
                  movie: movie,
                  discount: discount,
                  onDiscountTap: decreaseDiscount,
                  isBookmarked:
                  bookmarkedMovies.contains(movie.title),
                  onBookmarkTap: () {
                    toggleBookmark(movie.title);
                  },
                );
              },
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                final isBookmarked =
                bookmarkedMovies.contains(movie.title);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 160,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 110,
                          height: 160,
                          child: Image.asset(
                            movie.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        movie.title,
                                        maxLines: 2,
                                        overflow:
                                        TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: isBookmarked
                                          ? 'Remove Bookmark'
                                          : 'Add Bookmark',
                                      constraints:
                                      const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        toggleBookmark(movie.title);
                                      },
                                      icon: Icon(
                                        isBookmarked
                                            ? Icons.bookmark_rounded
                                            : Icons.bookmark_border_rounded,
                                        size: 21,
                                        color: isBookmarked
                                            ? const Color(0xFFFFC857)
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  movie.genre,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme.secondary,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text('Year: ${movie.year}'),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      movie.rating.toStringAsFixed(1),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: decreaseDiscount,
                                  child: Text(
                                    '$discount% OFF',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
