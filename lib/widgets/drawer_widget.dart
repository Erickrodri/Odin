import 'package:flutter/material.dart';
import 'package:odin/data/drawer_items.dart';
import 'package:odin/models/drawer_item.dart';

class DrawerWidget extends StatelessWidget {

  final ValueChanged<DrawerItem> onSelectItem;

  const DrawerWidget({
    Key? key, 
    required this.onSelectItem
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Main Menu',
              style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
          ),
          buildDrawerItems()
        ],
      ),
    );
  }

  Widget buildDrawerItems() {
    return Column(
      children: DrawerItems.all
        .map(
          (item) => ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            leading: Icon(
              item.icon,
              color: Colors.black38,
              ),
            title: Text(
              item.title,
              style: TextStyle(color: Colors.black38),
              ),
            onTap: () => onSelectItem(item),
          )
        ).toList(),
    );
  }
}