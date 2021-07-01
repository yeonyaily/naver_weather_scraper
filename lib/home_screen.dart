import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loaded = false;
  String temperature;
  String description;
  String rainFall;
  String location;
  String siteUrl = 'https://weather.naver.com/';

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
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: (loaded)
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(temperature),
            Text(description),
            Text(rainFall),
            Text(location),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }

  void getData() async {
    final WebScraper webScraper = WebScraper(siteUrl);
    if (await webScraper.loadWebPage("")) {
      List<Map<String, dynamic>> _temperature = webScraper.getElement(
          'div.weather_area > strong.current',
          ['title']);
      List<Map<String, dynamic>> _description = webScraper.getElement(
          'div.weather_area > p.summary > span.weather.before_slash',
          ['innerHtml']);
      List<Map<String, dynamic>> _rainFall = webScraper.getElement(
          'div.weather_area > dl.summary_list > dd.desc',
          ['innerHtml']);
      List<Map<String, dynamic>> _location = webScraper.getElement(
          'div.location_area > strong.location_name',
          ['innerHtml']);

      setState(() {
        temperature = _temperature[0]['title'].replaceAll(RegExp(r'현재 온도'), '');
        description = _description[0]['title'];
        rainFall = _rainFall[0]['title'];
        location = _location[0]['title'];
        loaded = true;
      });
    }
  }
}
