import 'package:flutter/material.dart';
import 'package:ui_challenge/ui/screen/detailpage.dart';
import 'package:ui_challenge/ui/screen/widget/detailLine_widget.dart';
import 'package:ui_challenge/ui/screen/widget/paddingText_widget.dart';
import 'package:ui_challenge/ui/screen/widget/text_category_widget.dart';

class SlideCard extends StatelessWidget {
  final int id;
  final String title;
  final String category;
  final String detail;
  final String status;
  final double percent;
  final String fund;
  final String dayleft;
  final String image;
  SlideCard(
      {this.id,
      this.title,
      this.category,
      this.detail,
      this.status,
      this.percent,
      this.fund,
      this.dayleft,
      this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new DetailPage(image: image, id: id)),
        );
      },
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10)),
                    child: Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
                Detail(
                  category: category,
                  title: title,
                  percent: percent,
                  dayleft: dayleft,
                  image: image,
                  fund: fund,
                  status: status,
                  detail: detail,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            heightFactor: 10,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75.0,right: 10),
              child: RawMaterialButton(
              onPressed: () {},
              child: new Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20.0,
              ),
              shape: new CircleBorder(),
              fillColor: Color(0xff162997),
              elevation: 0.0,
            )
            ),
          )
        ],
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final String category;
  final String title;
  final String detail;
  final double percent;
  final String fund;
  final String dayleft;
  final String image;
  final String status;
  Detail(
      {this.category,
      this.title,
      this.percent,
      this.dayleft,
      this.image,
      this.fund,
      this.detail,
      this.status});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextCategory(
            text: category,
          ),
          TextPaddingTop(
            text: title,
            fontsizevalue: 23,
            paddingvalue: 10,
            fontWeightvalue: FontWeight.bold,
          ),
          TextPaddingTop(
              fontsizevalue: 13,
              paddingvalue: 10,
              fontWeightvalue: FontWeight.w200,
              text: detail),
          DetailLine(
            topLeft: status,
            topRight: fund + " ETH",
            bottomLeft: dayleft + " day left",
            bottomRight: "Collected",
            percent: percent,
            withIcon: true,
          )
        ],
      ),
    );
  }
}
