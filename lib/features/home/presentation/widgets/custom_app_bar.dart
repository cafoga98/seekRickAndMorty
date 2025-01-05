import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final int currentPageIndex;
  final VoidCallback? onPressedEpisodes;
  final VoidCallback? onPressedCharacter;
  final VoidCallback? onPressedLocation;
  final ValueChanged<String>? onChanged;

  const CustomAppBar({
    super.key,
    required this.currentPageIndex,
    required this.onPressedEpisodes,
    required this.onPressedCharacter,
    required this.onPressedLocation,
    required this.onChanged,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSearch
              ? SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Busca un personaje'),
                    onChanged: widget.onChanged,
                  ),
                )
              : Row(
                  children: [
                    IconButton(
                      onPressed: widget.onPressedEpisodes,
                      icon: Column(
                        children: widget.currentPageIndex == 0
                            ? const [
                                Icon(
                                  Icons.local_movies,
                                  color: Colors.white,
                                ),
                                Text('Episodios')
                              ]
                            : const [
                                Icon(
                                  Icons.local_movies_outlined,
                                ),
                                Text('Episodios')
                              ],
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onPressedCharacter,
                      icon: Column(
                        children: widget.currentPageIndex == 1
                            ? const [
                                Icon(Icons.people, color: Colors.white),
                                Text('Personajes')
                              ]
                            : const [
                                Icon(
                                  Icons.people_outline,
                                ),
                                Text('Personajes')
                              ],
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onPressedLocation,
                      icon: Column(
                        children: widget.currentPageIndex == 2
                            ? const [
                                Icon(Icons.location_on, color: Colors.white),
                                Text('Locaciones'),
                              ]
                            : const [
                                Icon(Icons.location_on_outlined),
                                Text('Locaciones'),
                              ],
                      ),
                    ),
                  ],
                ),
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
