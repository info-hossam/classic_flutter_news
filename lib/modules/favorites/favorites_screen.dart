import 'package:classic_flutter_news/modules/articles/article_details_screen.dart';
import 'package:classic_flutter_news/shared/components/shared_components.dart';
import 'package:classic_flutter_news/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: 20,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, indx) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: _buildFavArticlesCards(context, indx)),
              SizedBox(width: 10),
              Expanded(child: _buildFavArticlesCards(context, indx)),
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildFavArticlesCards(BuildContext context, int indx) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () => navigateTo(
            context,
            destination: ArticleDetailsScreen(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  'https://image.freepik.com/free-vector/man-playing-laptop-vector-clipart_53876-105463.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Mauris nunc congue nisi vitae suscipit. Mauris pharetra et',
                  style: kArticleTitleStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: (indx % 2 == 0)
              ? IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () {},
                )
              : IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
        ),
      ],
    );
  }
}
