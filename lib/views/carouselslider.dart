import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:contra_care/views/about_us.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/faqs.dart';
import 'package:contra_care/views/queryform.dart';
import 'package:flutter/material.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>PillsBrands()),
              );
            },
            child: RecomendPlantCard(
              image: "assets/images/med_img.png",
              title: "Pills Brands",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PillsBrands(),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FaqsPage()),
              );
            },
            child: RecomendPlantCard(
              image: "assets/images/faq_img.png",
              title: "FAQS",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaqsPage(),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: RecomendPlantCard(
              image: "assets/images/image_1.png",
              title: "Pills Tracker",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormFour()),
              );
            },
            child: RecomendPlantCard(
              image: "assets/images/lady_img.png",
              title: "Ask Query",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormFour(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);

  final String image, title;

  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 20,top: 20,bottom: 20
      ),
      width: size.width * 0.35,
      height: size.height * 0.2,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n",
                            style: Theme.of(context).textTheme.button),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}