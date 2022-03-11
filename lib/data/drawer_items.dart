import 'package:flutter/material.dart';
import 'package:odin/models/drawer_item.dart';

class DrawerItems {
  static final home = DrawerItem(icon: Icons.home, title: 'Home'); 
  static final user = DrawerItem(icon: Icons.person, title: 'Profile');

  static final List<DrawerItem> all = [
    home,
    user
  ];

}