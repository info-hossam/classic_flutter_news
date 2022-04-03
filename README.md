# classic_flutter_news

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

************************************************************************

Column(
            children: List.generate(
              2,
              (_) => Row(
                children: List.generate(
                  2,
                  (index) => Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => navigateTo(
                              context,
                              destination: ArticleDetailsScreen(),
                            ),
                            child: Card(
                              elevation: 4.5,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(
                                // 'https://image.freepik.com/free-vector/man-playing-laptop-vector-clipart_53876-105463.jpg',
                                data[index]['urlToImage'],
                                // height: 100,
                                // width: 200,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.network(
                                        'https://image.freepik.com/free-vector/man-playing-laptop-vector-clipart_53876-105463.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip',
                            style: kArticleTitleStyle,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

