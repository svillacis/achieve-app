import 'package:achieve/constants.dart';
import 'package:achieve/quotes/quote_data.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:achieve/components/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class RandomScreen extends StatefulWidget {
  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  var random = new Random();
  int randomNumber;

  void getRandom() {
    setState(() {
      randomNumber = random.nextInt(dailyQuotes.length);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRandom();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: SizeConfig.blockSizeVertical * 4,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    FontAwesomeIcons.quoteLeft,
                    color: Color(0xffff6768),
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: (SizeConfig.blockSizeVertical * 50),
                  ),
                  child: AutoSizeText(
                    dailyQuotes[randomNumber].phrase,
                    style: kQuoteText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    FontAwesomeIcons.quoteRight,
                    color: Color(0xffff6768),
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  dailyQuotes[randomNumber].author,
                  textAlign: TextAlign.start,
                  style: kAuthorStyle,
                ),
              ],
            ),
          ),
        ),
        IconButton(
            splashColor: Color(0xffff6768),
            splashRadius: 50,
            padding: EdgeInsets.only(bottom: 40),
            icon: FaIcon(
              FontAwesomeIcons.dice,
              color: Color(0xff6b778d),
              size: 50,
            ),
            onPressed: getRandom),
        divider,
      ],
    );
  }
}
