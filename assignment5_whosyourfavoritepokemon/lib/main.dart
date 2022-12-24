import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(150, (i) => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i+1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _numFavorited = 0;

  void _updateFavorites(int delta) {
    setState(() {
      _numFavorited += delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List ';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text('$title$_numFavorited'),
        ),
        body: ListView.builder(
          itemCount: widget.items.length ~/ 3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: FavoriteIcon(
                  imageUrl: widget.items[index*3],
                  onFavorite: _updateFavorites,
                )),
                Expanded(child: FavoriteIcon(
                  imageUrl: widget.items[index*3+1],
                  onFavorite: _updateFavorites,
                )),
                Expanded(child: FavoriteIcon(
                  imageUrl: widget.items[index*3+2],
                  onFavorite: _updateFavorites,
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
class FavoriteIcon extends StatefulWidget {
  final String imageUrl;
  final void Function(int) onFavorite;

  const FavoriteIcon({
  super.key,
  required this.imageUrl,
  required this.onFavorite,
  });

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      widget.onFavorite(_isFavorited ? 1 : -1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(widget.imageUrl),
        IconButton(
          icon: Icon(
            _isFavorited ? Icons.favorite : Icons.favorite_border,
            color: _isFavorited ? Colors.red : null,
            size: 50,
          ),
          onPressed: _toggleFavorite,
        ),
      ],
    );
  }
}