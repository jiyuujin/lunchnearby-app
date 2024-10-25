import 'package:base_widgets/models/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const title = 'Lunch Nearby';

final List<TabItem> tabItems = [
  TabItem(icon: Icons.home.codePoint, name: 'Home'),
  TabItem(icon: Icons.map.codePoint, name: 'Map'),
];

// 有明セントラルタワー ホール&カンファレンス
const centerPos = LatLng(35.6321071, 139.7911525);
