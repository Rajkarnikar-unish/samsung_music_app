import 'package:flutter/material.dart';
import 'package:samsung_music_app/widgets/circle_buttons.dart';
import '../model/songs.dart';

class SongsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // final ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SAMSUNG Music'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          // width: size.width,
          // height: size.height,
          color: Colors.black,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    'Favorites',
                    'Playlists',
                    'Tracks',
                    'Albums',
                    'Artists',
                    'Genres',
                    'Folders',
                    'Composers'
                  ]
                      .map((menu) => PageOption(
                            pageTitle: menu,
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[900],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              fit: StackFit.passthrough,
                              alignment: Alignment.centerLeft,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.sort_rounded,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    print('small menu');
                                  },
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  CircleButtons(
                                    color: Colors.grey[850],
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.shuffle,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  CircleButtons(
                                    color: Colors.grey[850],
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: SONGS.length,
                            itemBuilder: (context, index) => SongsItem(
                              songsData: SONGS[index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageOption extends StatelessWidget {
  final String pageTitle;

  const PageOption({Key key, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      child: Text(
        pageTitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SongsItem extends StatelessWidget {
  final dynamic songsData;
  final Size size;

  const SongsItem({Key key, @required this.songsData, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      // width: size.width * 0.98,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 10, 10, 10),
            child: Row(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    songsData['albumArt'],
                    width: 60,
                    height: 40,
                  ),
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${songsData['title']}",
                        style: themeData.textTheme.bodyText1),
                    Text(
                      "${songsData['artist']}",
                      style: themeData.textTheme.bodyText2,
                    )
                  ],
                ),
                SizedBox(
                  width: 155,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 100,
            ),
            child: Divider(
              color: Colors.grey[600],
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// child: ListView.builder(
//                           itemCount: SONGS.length,
//                           itemBuilder: (context, index) =>
//                               SongsItem(songsData: SONGS[index]),
//                         ),