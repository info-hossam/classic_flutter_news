import 'package:classic_flutter_news/shared/components/constants.dart';
import 'package:classic_flutter_news/shared/components/shared_components.dart';
import 'package:flutter/material.dart';

Widget _buildPageBody({
  String title,
  String image,
}) =>
    Container(
      
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              elevation: 4.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                
                '$image',
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildChips(
                title: '$title',
              ),
            ),
          ],
        ),
      ),
    );

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: kCategoriesList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildPageBody(
              title: kCategoriesList[index], image: kCategoriesImagesUrl[index]),
        ),
      ),
    );
  }
}
