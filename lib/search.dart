import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'display.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final search = TextEditingController();

  searchMovie() async {
    var load;
    showDialog(
        context: context,
        builder: (ctx) {
          load = ctx;
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.transparent,
            content: Center(
              child: LoadingBouncingGrid.square(
                backgroundColor: Color(0xFFFC6600),
                duration: Duration(milliseconds: 1000),
              ),
            ),
          );
        },
        barrierDismissible: false);
    Dio dio = Dio();
    try {
      Response response = await dio
          .get("https://movieverdict.herokuapp.com/get-verdict/" + search.text);
      Navigator.pop(load);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Display(response.data, search.text)));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            "Movie Verdict",
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: search,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "Search a movie",
                hintStyle: TextStyle(color: Color(0xffeeeeee)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffeeeeee),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Search Movie",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: searchMovie,
                color: Color(0xFFFC6600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
