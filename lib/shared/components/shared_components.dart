import 'package:classic_flutter_news/modules/articles/article_details_screen.dart';
import 'package:classic_flutter_news/shared/styles/colors.dart';
import 'package:classic_flutter_news/shared/styles/styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

AppBar defaultAppBar(
        {BuildContext currentContext,
        String title,
        bool articleAppBar = false}) =>
    (articleAppBar)
        ? AppBar(
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: kBlack,
              onPressed: () => navigateBack(currentContext),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  color: kBlack,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.share_outlined),
                  color: kBlack,
                  onPressed: () {}),
            ],
          )
        : AppBar(
            title: Text(
              title,
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0.0,
          );

Widget buildChips({String title}) => Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: kCategoryTextStyle,
      ),
    );

Widget buildHeadlines({String title}) => Row(
      children: [
        Container(
          width: 5,
          height: 30,
          color: Color(0xFFD10462),
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: kHeadlinesStyle,
        )
      ],
    );

Widget buildArticlesCard(BuildContext context, {data}) =>
    GestureDetector(
      onTap: () => navigateTo(
        context,
        destination: ArticleDetailsScreen(model: data),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,

              offset: Offset(0.0, 1.0), //(x,y)

              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Card(
              elevation: 4.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                data['urlToImage'],
                width: 110,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://image.freepik.com/free-vector/man-playing-laptop-vector-clipart_53876-105463.jpg',
                  width: 110,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['title'],
                    style: kArticleTitleStyle.copyWith(
                      color: kLightBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  SizedBox(height: 5),
                  Text(
                    data['description'],
                    style: kArticleTitleStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      buildChips(title: 'Covid-19'),
                      SizedBox(width: 16),
                      Icon(
                        Icons.date_range,
                        size: 16,
                        color: kLightBlue,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.parse(
                              data['publishedAt'])),
                          style: kCategoryTextStyle.copyWith(
                            color: kBlack,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

void navigateTo(BuildContext context, {@required Widget destination}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));

void navigateBack(BuildContext context) => Navigator.pop(context);
