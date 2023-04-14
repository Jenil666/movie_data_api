import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_data_api/screens/search/modal/search_modal.dart';
import 'package:movie_data_api/utils/api_helper.dart';

class SearchController extends GetxController
{
  RxString movie = "Pathan".obs;
  TextEditingController txtmovie = TextEditingController();
  Future<MovieDetails> movieGetApiCalling(String movie)
  async {
    ApiHelper api = ApiHelper();
   MovieDetails jsonData = await api.MovieGerApi(movie);
    return jsonData;
  }
}