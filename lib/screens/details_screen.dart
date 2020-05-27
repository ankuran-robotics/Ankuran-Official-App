import 'package:ankuran/constants.dart';
import 'package:ankuran/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .52,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Achievement \nand Awards",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Some Memorable \nand Precious Gems",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width:
                        size.width * .6, // it just takes 60% of the total width
                    child: Text(
                        "Scroll Down below and have a visit through our memory lane and a great source of inspiration"),
                  ),
                  SizedBox(
                    width: size.width * .6, // It Just Takes the 60% width
                    child: SearchBar(),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 25,
                    children: <Widget>[
                      SessionCard(
                        sessionNum: 1,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 2,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 3,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 4,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 5,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 6,
                        press: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available width for this widget
          // padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(children: <Widget>[
                  Container(
                    height: 45,
                    width: 42,
                    decoration: BoxDecoration(
                      color: isDone ? kBlueColor : Colors.white,
                      border: Border.all(color: kBlueColor),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : kBlueColor,
                    ),
                  ),
                  Text(
                    "   Award  $sessionNum",
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
