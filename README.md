# 🔹 Flutter에서 naver 날씨 Scrap하기

### 1. package

```dart
import 'package:web_scraper/web_scraper.dart';
```

- web_scraper: ^0.1.4
- web에 있는 정보를 scrap해서 flutter에서 사용할 수 있게 해주는 package

### 2. 사용 방법

```dart
String siteUrl = 'https://weather.naver.com/';
--------------------------------------------------------------------------------

void getData() async {
    final webScraper = WebScraper(siteUrl);
    if (await webScraper.loadWebPage("")) {
      var _temperature =
      webScraper.getElement('div.weather_area > strong.current', ['title']);
      var _description = webScraper.getElement(
          'div.weather_area > p.summary > span.weather.before_slash',
          ['innerHtml']);
      var _rainFall = webScraper.getElement(
          'div.weather_area > dl.summary_list > dd.desc', ['innerHtml']);
      var _location = webScraper.getElement(
          'div.location_area > strong.location_name', ['innerHtml']);

      setState(() {
        temperature = _temperature[0]['title'].replaceAll(RegExp(r'현재 온도'), '');
        description = _description[0]['title'];
        rainFall = _rainFall[0]['title'];
        location = _location[0]['title'];
        loaded = true;
      });
    }
  }
```

- webScraper를 사용하여 siteUrl 주소의 웹을 scrap한다.
- getElement를 사용하여 html의 data를 가져올 수 있다.
- 해당하는 data들이 모두 list형태로 저장되므로 원하는 index에 접근하여 사용할 수 있다.

    ex) var _location = webScraper.getElement(
              'div.location_area > strong.location_name', ['innerHtml']); **⇒⇒⇒ "남구 상대동"**
