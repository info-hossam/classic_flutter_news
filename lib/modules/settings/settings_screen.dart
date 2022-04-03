import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final List<IconData> _icons = const [
    Icons.favorite,
    Icons.brightness_4_outlined,
    Icons.info_outline_rounded,
  ];

  final List<String> _tags = const [
    'Favorites',
    'Dark Mode',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(
            _icons[index],
          ),
          title: Text(_tags[index]),
          trailing: (index == 1)
              ? Icon(
                  Icons.toggle_off_rounded,
                  size: 40,
                )
              : SizedBox(),
        ),
        separatorBuilder: (context, indx) => Divider(),
      ),
    );
  }
}
