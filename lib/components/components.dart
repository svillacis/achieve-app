import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget {
  Header(this.title, this.iconData);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Color(0xff0f1623),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: FaIcon(
                iconData,
                color: Colors.white,
              ),
              onPressed: null,
              iconSize: 20,
              alignment: Alignment.centerRight,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
              ),
              //textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}

class BookHeader extends StatelessWidget {
  BookHeader(this.title, this.onPress);

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Color(0xff0f1623),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 5, right: 15, bottom: 0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                size: 30,
                color: Color(0xff6b778d),
              ),
              onPressed: onPress,
              alignment: Alignment.centerRight,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
              //textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
