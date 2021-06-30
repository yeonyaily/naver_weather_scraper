import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String image;
  // final String temperate;
  final String time;

  const ResultItem(
      // {Key key, this.image, this.temperate, this.time})
    {Key key, this.image, this.time})

      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 400.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(15.0),
            //   child: Image.network(
            //     image,
            //     height: 300.0,
            //     width: 300.0,
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
            // Text(
            //   temperate ?? 'failed to load',
            //   style: TextStyle(
            //     color: Colors.black87,
            //     fontSize: 18.0,
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
            Text(
              image ?? 'failed to load',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2),
            ),
            Text(
              time ?? 'failed to load',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}