import 'package:achieve/quotes/quote_data.dart';
import 'package:flutter/material.dart';
import 'package:achieve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:achieve/components/size_config.dart';

class DailyQuote extends StatefulWidget {
  @override
  _DailyQuoteState createState() => _DailyQuoteState();
}

class _DailyQuoteState extends State<DailyQuote> {
  // LocalNotifyManager localNotifyManager = LocalNotifyManager.init();

  // onNotificationReceive(ReceiveNotification notification) {
  //   print('Notification received: ${notification.id}');
  // }

  int getCurrentDate() {
    var now = new DateTime.now();
    return ((now.day + (now.month - 1) * 31) % 318);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   alignment: Alignment.topRight,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 20, right: 10),
        //     child: IconButton(
        //       icon: FaIcon(
        //         FontAwesomeIcons.bell,
        //         color: Color(0xff6b778d),
        //       ),
        //       onPressed: _addAlarm,
        //       // onPressed: () async {
        //       //   await localNotifyManager.showDailyAtTimeNotification(
        //       //       dailyQuotes[getCurrentDate()].phrase,
        //       //       "Daily Quote by ${dailyQuotes[getCurrentDate()].author}");
        //       // },
        //       iconSize: 25,
        //       splashRadius: 20,
        //     ),
        //   ),
        // ),
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
                    maxHeight: (SizeConfig.blockSizeVertical * 55),
                  ),
                  child: AutoSizeText(
                    dailyQuotes[getCurrentDate()].phrase,
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
                  dailyQuotes[getCurrentDate()].author,
                  textAlign: TextAlign.start,
                  style: kAuthorStyle,
                ),
              ],
            ),
          ),
        ),
        divider,
      ],
    );
  }

  // void _addAlarm() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => AddNotificationScreen()));
  // }
}
