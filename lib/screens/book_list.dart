import 'package:achieve/screens/book_screen.dart';
import 'package:flutter/material.dart';
import 'package:achieve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:achieve/components/components.dart';
// import 'package:achieve/books/book_data.dart';
import 'package:achieve/components/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:achieve/books/books.dart';

class BookList extends StatefulWidget {
  BookList({this.bookList, this.title});

  final List bookList;
  final String title;

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  bool initial = true;

  void onItemTap() {
    setState(() {
      initial = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return initial
        ? Column(
            children: <Widget>[
              BookHeader(widget.title, onItemTap),
              divider,
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      BookTile(widget.bookList[0], '1'),
                      BookTile(widget.bookList[1], '2'),
                      BookTile(widget.bookList[2], '3'),
                      BookTile(widget.bookList[3], '4'),
                      BookTile(widget.bookList[4], '5')
                    ],
                  ),
                ),
              ),
              divider,
            ],
          )
        : BookScreen();
  }
}

class BookTile extends StatelessWidget {
  final Book book;
  final String number;

  BookTile(this.book, this.number);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '$number.',
                style: kNumberText,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      book.title,
                      style: kTitleText,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'By ${book.author}',
                      style: kAuthorText,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1,
          ),
          Image.asset(
            'images/${book.image}.jpg',
            height: SizeConfig.blockSizeVertical * 50,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            book.synopsis,
            style: kSynopsisText,
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.amazon,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  _launchURL(book.amazonLink);
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.audible,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  _launchURL(book.audibleLink);
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          blueDivider,
        ],
      ),
    );
  }
}
