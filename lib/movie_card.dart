
import 'package:flutter/material.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final int discount;
  final VoidCallback onDiscountTap;
  final bool isBookmarked;
  final VoidCallback? onBookmarkTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.discount,
    required this.onDiscountTap,
    this.isBookmarked = false,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const gold = Color(0xFFFFC857);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 75,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.65),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: gold,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 17,
                          color: Color(0xFF171717),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          movie.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Color(0xFF171717),
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 7,
                  right: 7,
                  child: IconButton(
                    tooltip: isBookmarked
                        ? 'Remove Bookmark'
                        : 'Add Bookmark',
                    onPressed: onBookmarkTap,
                    icon: Icon(
                      isBookmarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                    ),
                    color: isBookmarked ? gold : Colors.white,
                    style: IconButton.styleFrom(
                      backgroundColor:
                      Colors.black.withValues(alpha: 0.55),
                      fixedSize: const Size(40, 40),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.75),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Text(
                      '${movie.year}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 10, 11, 3),
            child: Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 2, 11, 7),
            child: Text(
              movie.genre,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFFB8B8B8),
                fontSize: 11,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 10),
            child: SizedBox(
              width: double.infinity,
              child: Material(
                color: gold.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(9),
                child: InkWell(
                  onTap: onDiscountTap,
                  borderRadius: BorderRadius.circular(9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.local_offer_outlined,
                          color: gold,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '$discount% OFF',
                          style: const TextStyle(
                            color: gold,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
