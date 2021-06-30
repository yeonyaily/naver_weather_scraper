import 'package:flutter/material.dart';
import 'package:naver_weather_scraper/result_item.dart';
import 'package:web_scraper/web_scraper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loaded = false;
  List<ResultItem> resultList = List();
  String etsyUrl = 'https://weather.naver.com/';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: (loaded)
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: resultList.getRange(0, 50).toList(),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  void getData() async {
    resultList.clear();

    final WebScraper webScraper = WebScraper(etsyUrl);
    // List<Map<String, dynamic>> images = webScraper.getElement(
    //     'i.ico_cnLazy.ico_wt1',
    //     ['src']);
    // List<Map<String, dynamic>> temperates = webScraper.getElement(
    //     'text.bb_text.bb_text-0',
    //     ['title']);
    if (await webScraper.loadWebPage("")) {
      List<Map<String, dynamic>> images = webScraper.getElement(
          'item_time',
          ['innerHtml']);
      List<Map<String, dynamic>> times =
          webScraper.getElement('span.time', ['innerHtml']);

      times.forEach((image) {
        int i = times.indexOf(image);
        print(i);
        print(images[i]['title']);
        resultList.add(ResultItem(
          image: images[i]['title'],
          time: times[i]['title'],
        ));
      });
      setState(() {
        loaded = true;
      });
    }

    // images.forEach((image) {
    //   int i = images.indexOf(image);
    //   resultList.add(ResultItem(
    //     image: images[i]['attributes']['src'],
    //     temperate: temperates[i]['title'].toString().trim(),
    //     time: times[i]['title'],
    //   ));
    // }
  }
}
