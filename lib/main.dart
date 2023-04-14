import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_data_api/screens/search/view/search_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => SearchScreen(),
      },
    ),
  );
}
