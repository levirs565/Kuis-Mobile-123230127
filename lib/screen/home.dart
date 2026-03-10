import 'package:flutter/material.dart';
import 'package:kuis/repository/auth.dart';
import 'package:kuis/repository/favorite.dart';
import 'package:kuis/repository/newsmodel.dart';
import 'package:kuis/screen/detail.dart';
import 'package:kuis/screen/login.dart';
import 'package:kuis/screen/profile.dart';

class HomePage extends StatelessWidget {
  static createRoute() => MaterialPageRoute(builder: (context) => HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        actions: [
          IconButton(
            onPressed: () => _onProfilePressed(context),
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => _onLogoutPressed(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: FavoriteRepository.favoriteList,
        builder: (context, value) {
          return ListView.builder(
            itemCount: dummyNews.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, dummyNews[index]),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, NewsModel item) {
    final isFavorite = FavoriteRepository.isFavorite(item);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => _onItemClicked(context, item),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(item.image),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                         Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        Text("${item.likes + (isFavorite ? 1 : 0)} likes"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogoutPressed(BuildContext context) {
    AuthRepository.logout();
    Navigator.of(context).pushReplacement(LoginPage.createRoute());
  }

  void _onProfilePressed(BuildContext context) {
    Navigator.of(context).push(ProfilePage.createRoute());
  }

  void _onItemClicked(BuildContext context, NewsModel item) {
    Navigator.of(context).push(DetailPage.createRoute(item));
  }
}
