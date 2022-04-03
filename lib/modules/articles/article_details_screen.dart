import 'package:classic_flutter_news/shared/components/shared_components.dart';
import 'package:classic_flutter_news/shared/styles/colors.dart';
import 'package:classic_flutter_news/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final dynamic model;
  ArticleDetailsScreen({this.model});

  Column _buildPageHeader({dataModel}) => Column(
        children: [
          Card(
              elevation: 4.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                dataModel['urlToImage'],
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://image.freepik.com/free-vector/creative-delta-variant-illustration_23-2149212701.jpg?w=740',
                  width: double.infinity,
                ),
              )),
          SizedBox(height: 5),
          Text(
            dataModel['title'],
            style: kArticleTitleStyle.copyWith(
              wordSpacing: 2,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.date_range,
                color: kLightBlue,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                // '5-2-2022',
                DateFormat().format(DateTime.parse(dataModel['publishedAt'])),
                style: kCategoryTextStyle.copyWith(
                  color: kBlack,
                ),
              ),
              SizedBox(width: 16),
              Icon(
                Icons.remove_red_eye_outlined,
                color: kLightBlue,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                '300',
                style: kCategoryTextStyle.copyWith(
                  color: kBlack,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: buildChips(title: 'COVID-19'),
              ),
            ),
          ),
          SizedBox(height: 2.5),
          Divider(
            color: kGrey,
          ),
        ],
      );

  Widget _buildPageBody({dataModel}) => Text(
        dataModel['description'],
        style: kArticleBodyStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        currentContext: context,
        articleAppBar: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildPageHeader(dataModel: model),
              SizedBox(height: 10),
              _buildPageBody(dataModel: model),
            ],
          ),
        ),
      ),
    );
  }
}
