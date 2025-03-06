import 'package:base_widgets/models/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const title = 'Lunch Nearby';

final List<TabItem> tabItems = [
  TabItem(icon: Icons.home.codePoint, name: 'Home'),
  TabItem(icon: Icons.map.codePoint, name: 'Map'),
  TabItem(icon: Icons.settings.codePoint, name: 'Setting'),
];

final settingsItems = [
  '情報出所',
];

// 有明セントラルタワーホール＆カンファレンス
const position = '有明セントラルタワーホール＆カンファレンス';
const centerLat = 35.6321071;
const centerLng = 139.7911525;
const centerPos = LatLng(centerLat, centerLng);

const tabelogUrl =
    'https://tabelog.com/tokyo/A1313/A131306/R466/rstLst/?vs=1&sa=%E6%9C%89%E6%98%8E%E9%A7%85%EF%BC%88%E6%9D%B1%E4%BA%AC%E9%83%BD%EF%BC%89&sk=&lid=top_navi1&vac_net=&svd=20241116&svt=1900&svps=2&hfc=1&sw=';
