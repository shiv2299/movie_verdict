import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final data;
  final name;
  Display(this.data, this.name);

  var heading =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  var content =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5 + 5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.srcOver),
                        image: NetworkImage(data["image_url"]),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  name.toString().toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Verdict - ",
                      style: heading,
                    ),
                    Text(
                      data["verdict"],
                      style: content,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Director",
                          style: heading,
                        ),
                        Text(
                          data["director"],
                          style: content,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Rating",
                          style: heading,
                        ),
                        Text(
                          data["rating"].toString(),
                          style: content,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genre",
                          style: heading,
                        ),
                        Text(
                          data["genre"],
                          style: content,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Release Date",
                          style: heading,
                        ),
                        Text(
                          data["release_date"].toString(),
                          style: content,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: AppBar().preferredSize.height + 25,
              padding: EdgeInsets.symmetric(vertical: 25),
              color: Color(0xFFFC6600).withOpacity(0.1),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
