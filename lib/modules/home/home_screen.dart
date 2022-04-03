import 'package:classic_flutter_news/modules/articles/article_details_screen.dart';
import 'package:classic_flutter_news/shared/components/constants.dart';
import 'package:classic_flutter_news/shared/components/shared_components.dart';
import 'package:classic_flutter_news/shared/cubit/main_cubit.dart';
import 'package:classic_flutter_news/shared/cubit/main_states.dart';
import 'package:classic_flutter_news/shared/styles/colors.dart';
import 'package:classic_flutter_news/shared/styles/styles.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildPageHeader({data}) {
    const double _height = 230;
    return Container(
      height: _height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => navigateTo(
            context,
            destination: ArticleDetailsScreen(model: data[index]),
          ),
          child: Container(
            width: 300,
            child: Card(
              elevation: 4.5,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image(
                          image: NetworkImage(data[index]['urlToImage']),
                          width: 300,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.network(
                            'https://image.freepik.com/free-vector/creative-delta-variant-illustration_23-2149212701.jpg?w=740',
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildChips(title: 'COVID-19'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              // 'Lorem Ipsum Dolor',
                              data[index]['title'],
                              style: kHeadlinesStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
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
                                DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(data[index]['publishedAt'])),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageBody(BuildContext context, {data}) => Column(
        children: [
          buildHeadlines(title: 'Categories'),
          SizedBox(height: 15),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: kCategoriesList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: buildChips(title: kCategoriesList[index]),
              ),
            ),
          ),
          SizedBox(height: 15),
          buildHeadlines(title: 'Top headlines!'),
          SizedBox(height: 15),
          GridView.builder(
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) => Column(
              children: [
                GestureDetector(
                  onTap: () => navigateTo(
                    context,
                    destination: ArticleDetailsScreen(
                      model: data[index],
                    ),
                  ),
                  child: Card(
                    elevation: 4.5,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      data[index]['urlToImage'],
                      errorBuilder: (context, error, stackTrace) => Image.network(
                          'https://image.freepik.com/free-vector/man-playing-laptop-vector-clipart_53876-105463.jpg'),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  data[index]['title'],
                  style: kArticleTitleStyle,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildPageFooter(BuildContext context, {data}) => Column(
        children: List.generate(
          20,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: buildArticlesCard(
              context,
              data: data[index],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final _cubit = MainCubit.get(context);
        return ConditionalBuilder(
          condition: _cubit.allNews.isNotEmpty,
          builder: (context) => Container(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  _buildPageHeader(
                    data: _cubit.allNews,
                  ),
                  SizedBox(height: 20),
                  _buildPageBody(
                    context,
                    data: _cubit.topHeadlines,
                  ),
                  SizedBox(height: 10),
                  buildHeadlines(title: 'Breaking News'),
                  SizedBox(height: 15),
                  _buildPageFooter(
                    context,
                    data: _cubit.allNews,
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
