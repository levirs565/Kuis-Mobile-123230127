import 'package:flutter/material.dart';
import 'package:kuis/repository/favorite.dart';
import 'package:kuis/repository/newsmodel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel data;

  const DetailPage({super.key, required this.data});

  static createRoute(NewsModel data) =>
      MaterialPageRoute(builder: (context) => DetailPage(data: data));

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(data.image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title, style: Theme.of(context).textTheme.titleLarge,),
                Text(data.description, style: Theme.of(context).textTheme.bodyLarge,),
                ListenableBuilder(
                    listenable: FavoriteRepository.favoriteList,
                    builder: (context, child) {
                      final _isFavorite = FavoriteRepository.isFavorite(data);
                      return Row(
                        children: [
                          IconButton(
                            onPressed: _onFavoriteClicked,
                            icon: Icon(
                              Icons.favorite,
                              color: _isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                          Text("${data.likes + (_isFavorite ? 1 : 0)} like"),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]
        ,
      )
      ,
    );
  }

  void _onFavoriteClicked() {
    // setState(() {
    //   _isFavorite = !_isFavorite;
    // });
    FavoriteRepository.toggleFavorite(widget.data);
  }
}
