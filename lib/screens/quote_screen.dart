import 'package:achieve/screens/cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:achieve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:achieve/components/size_config.dart';

class QuoteScreen extends StatefulWidget {
  QuoteScreen({this.quotes});

  final quotes;

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  int index = 0;
  String quote;
  String author;
  bool initial = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextQuote(0);
  }

  void onItemTap() {
    setState(() {
      initial = false;
    });
  }

  void nextQuote(int number) {
    index = (index + number) % widget.quotes.length;
    setState(
      () {
        quote = widget.quotes[index].phrase;
        author = widget.quotes[index].author;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return initial
        ? Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 35),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: 30,
                      color: Color(0xff6b778d),
                    ),
                    onPressed: onItemTap,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () => nextQuote(-1),
                      color: Color(0xffff6768),
                      iconSize: 40,
                      splashColor: Colors.blueGrey,
                      splashRadius: 30,
                      //visualDensity: VisualDensity.comfortable,
                    ),
                    Expanded(
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
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: (SizeConfig.blockSizeVertical * 50),
                            ),
                            child: AutoSizeText(
                              quote,
                              style: kQuoteText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
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
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                          Text(
                            author,
                            textAlign: TextAlign.start,
                            style: kAuthorStyle,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () => nextQuote(1),
                      color: Color(0xffff6768),
                      iconSize: 40,
                      splashColor: Colors.blueGrey,
                      splashRadius: 30,
                    ),
                  ],
                ),
              ),
              divider,
            ],
          )
        : CategoryScreen();
  }
}
