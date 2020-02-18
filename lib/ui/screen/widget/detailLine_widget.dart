import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailLine extends StatelessWidget {
  final String topRight;
  final String topLeft;
  final String bottomLeft;
  final String bottomRight;
  final double percent;
  final bool withIcon;
  DetailLine(
      {this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight,
      this.percent,
      this.withIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(topLeft,
                    style: TextStyle(
                        color: Color(0xff4652AF), fontWeight: FontWeight.bold)),
                Text(
                  topRight,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: percent,
              progressColor: Color(0xff4652AF),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                withIcon == false
                    ? Text(
                        bottomLeft,
                        style: TextStyle(fontWeight: FontWeight.w100),
                      )
                    : Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            bottomLeft,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                Text(
                  bottomRight,
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
