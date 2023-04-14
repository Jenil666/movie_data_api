import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_data_api/screens/search/controller/search_controller.dart';
import 'package:movie_data_api/screens/search/modal/search_modal.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SearchController get = Get.put(SearchController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff070d2d),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                controller: get.txtmovie,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          get.movie.value = get.txtmovie.text;
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    hintText: "Enter Movie Name",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Expanded(
              child: Obx(
                () => FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      MovieDetails? movie = snapshot.data as MovieDetails;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 350,
                              width: 200,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "${movie.d![0].i!.imageUrl}",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height: 280,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${movie.d![0].l}",style: GoogleFonts.ptSerif(fontSize: 30,color: Colors.white),),
                                  SizedBox(width: 5,),
                                  Text("(${movie.d![0].y})",style: TextStyle(fontSize: 25,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text("${movie.d![0].s}",style: TextStyle(fontSize: 15,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text("Rank:",style: TextStyle(fontSize: 15,color: Colors.white),),
                                      SizedBox(width: 3,),
                                      Text("${movie.d![0].rank}",style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                    ));
                  },
                  future: get.movieGetApiCalling(get.movie.value),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
