import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/constants.dart';
import 'package:ui_challenge/ui/screen/widget/card_widget.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.Background_COLOR,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30.0,
            ),
          ),
          actions: <Widget>[
            new RawMaterialButton(
              onPressed: () {},
              child: new Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30.0,
              ),
              shape: new CircleBorder(),
              fillColor: Colors.grey[200],
              elevation: 0.0,
            ),
          ],
        ),
        body: Container(
          color: AppColors.Background_COLOR,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Wallet(),// ສ່ວນສະແດງຜົນເງິນ (ໂຕທໍາອິດ)
                Category(), //ສ່ວນສະແດງຜົນຫົວຂໍ້ (ໂຕທີສອງ)
                Slider(), //ສ່ວນສະແດງຜົນcard ທີ່ເລື່ອນໄປມາ (ໂຕທີສາມ)
                Investment()//ສ່ວນສະແດງຜົນ ຈໍານວນໂຄງການທີ່ໄດ້ລົງທຶນ (ໂຕສຸດທ້າຍ)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Investment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Your investment",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          new RawMaterialButton(
            onPressed: () {},
            child: Text(
              "3",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            shape: new CircleBorder(),
            elevation: 0.0,
            fillColor: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 6.0,
              width: 6.0,
              decoration: new BoxDecoration(
                color: AppColors.PRIMARY_COLOR,
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '36.90 ETH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Text(
              ' /5 392 USD',
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Chip(
                label: Text(
                  '+2.54 ETH',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              Text(
                "  last month",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Popular project",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("- ALL",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    );
  }
}
// class Slider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       height: 450.0,
//       items: [1, 2, 3, 4, 5].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return SlideCard();
//           },
//         );
//       }).toList(),
//     );
//   }
// }

// class Slider extends StatelessWidget {
//   const Slider({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//             // Use future builder and DefaultAssetBundle to load the local JSON file
//             child: FutureBuilder(
//                 future: DefaultAssetBundle
//                     .of(context)
//                     .loadString('data/project.json'),
//                 builder: (context, snapshot) {
//                   // Decode the JSON
//                   var new_data = json.decode(snapshot.data.toString());

//                   return ListView.builder(
//                     // Build the ListView
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: <Widget>[
//                             Text("Name: " + new_data[index]['name']),
//                             Text("Height: " + new_data[index]['height']),
//                             Text("Mass: " + new_data[index]['mass']),
//                             Text(
//                                 "Hair Color: " + new_data[index]['hair_color']),
//                             Text(
//                                 "Skin Color: " + new_data[index]['skin_color']),
//                             Text(
//                                 "Eye Color: " + new_data[index]['eye_color']),
//                             Text(
//                                 "Birth Year: " + new_data[index]['birth_year']),
//                             Text("Gender: " + new_data[index]['gender'])
//                           ],
//                         ),
//                       );
//                     },
//                     itemCount: new_data == null ? 0 : new_data.length,
//                   );
//                 }),
//           ),
//     );
//   }
// }

class Slider extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  List cardList;
  int index = 0;

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString("data/project.json");
    setState(() {
      cardList = json.decode(jsonText);
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    if (cardList == null) {
      return Container(
        child: CircularProgressIndicator(),
      );
    }
    return CarouselSlider(
      enableInfiniteScroll: false,
      height: 450.0,
      items: cardList.map<Widget>((i) {
        double percent = i["percent"];
        int id = i["id"];
        String title = i["title"];
        String category = i["category"];
        String detail = i["detail"];
        String status = i["status"];
        String fund = i["fund"];
        String dayleft = i["dayleft"];
        String image = i["image"][0]["url"];
        return Builder(
          builder: (BuildContext context) {
            return SlideCard(
              id: id,
              title: title,
              category: category,
              detail: detail,
              status: status,
              percent: percent,
              fund: fund,
              dayleft: dayleft,
              image: image,
            );
          },
        );
      }).toList(),
    );
  }
}
