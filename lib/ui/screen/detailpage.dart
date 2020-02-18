import 'package:flutter/material.dart';
import 'package:ui_challenge/constants.dart';
import 'package:ui_challenge/ui/screen/widget/detailLine_widget.dart';
import 'package:ui_challenge/ui/screen/widget/paddingText_widget.dart';
import 'package:ui_challenge/ui/screen/widget/text_category_widget.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final int id;
  const DetailPage({Key key, this.image, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HeroImage(
            id: id,
            image: image,
          ),
          DetailCard(),
          SupportButton(),
          HeaderButton(),
          PlayButton()
        ],
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () => print("clicked"),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ));
  }
}

class HeroImage extends StatelessWidget {
  final int id;
  final String image;
  const HeroImage({this.id, this.image});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(image),
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: RawMaterialButton(
            onPressed: () {},
            child: new Icon(
              Icons.play_arrow,
              color: Color(0xff162997),
              size: 70.0,
            ),
            shape: new CircleBorder(),
            fillColor: Colors.white,
            elevation: 0.0,
          )),
    );
  }
}

class SupportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Divider(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () {},
              color: AppColors.PRIMARY_COLOR,
              child: const Text('Support the project',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40),
            topRight: const Radius.circular(40)),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.5,
          color: AppColors.Background_COLOR,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextCategory(
                      text: "Technology",
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 15,
                        ),
                        Text(
                          "15 days left",
                          style: TextStyle(fontWeight: FontWeight.w100),
                        ),
                      ],
                    )
                  ],
                ),
                TextPaddingTop(
                  text: '"Flu Forecast" - Future of Medicine',
                  fontsizevalue: 25,
                  paddingvalue: 30,
                  fontWeightvalue: FontWeight.bold,
                ),
                Divider(),
                DetailLine(
                  topLeft: "1 250.50 ETH",
                  topRight: "1 673.17 ETH",
                  bottomLeft: "85%",
                  bottomRight: "Collected",
                  percent: 0.85,
                  withIcon: false,
                ),
                Divider(),
                Tabbar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tabbar extends StatelessWidget {
  final List<Tab> tabsList = <Tab>[
    Tab(text: 'Description'),
    Tab(text: 'FAQ'),
    Tab(text: "Project News"),
    Tab(text: "Community"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: Color(0xff4652AF),
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xff4652AF),
            tabs: tabsList,
          ),
          Container(
            height: 200,
            child: TabBarView(
              children: [
                TextPaddingTop(
                    text:
                        "Mini 3-axis, 4K /60fps, rotatable lens, wireless preview and remote control with phone through Wi-Fi the project team",
                    paddingvalue: 30,
                    fontsizevalue: 20,
                    fontWeightvalue: FontWeight.normal),
                Text(
                    "Mini 3-axis, 4K /60fps, rotatable lens, wireless preview and remote control with phone through Wi-Fi the project team"),
                Text("data"),
                Text("data"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
