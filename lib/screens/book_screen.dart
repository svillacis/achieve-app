import 'package:achieve/books/book_data.dart';
import 'package:flutter/material.dart';
import 'package:achieve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:achieve/components/components.dart';
import 'package:achieve/screens/book_list.dart';
// import 'package:achieve/books/books.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Map<String, List> categories = {
    'Business': businessBooks,
    'Life': lifeBooks,
    'Study': studyBooks,
    'Mindfulness': mindfulnessBooks,
    'Entrepreneurship': entrepreneurshipBooks,
  };
  List displayList;
  String title;
  bool initial = true;

  void onItemTap(String catName) {
    setState(() {
      initial = false;
      displayList = categories[catName];
      title = catName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return initial
        ? Column(
            children: <Widget>[
              Header('Recommended Books', FontAwesomeIcons.book),
              divider,
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Category('Life', () => onItemTap('Life')),
                      Category('Business', () => onItemTap('Business')),
                      Category('Entrepreneurship',
                          () => onItemTap('Entrepreneurship')),
                      Category('Study', () => onItemTap('Study')),
                      Category('Mindfulness', () => onItemTap('Mindfulness')),
                    ],
                  ),
                ),
              ),
              divider,
            ],
          )
        : BookList(
            bookList: displayList,
            title: title,
          );
  }
}

class Category extends StatelessWidget {
  Category(this.name, this.press);
  final String name;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
      child: Row(
        children: [
          Expanded(child: Text(name, style: kCategoryText)),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
            onPressed: press,
            iconSize: 30,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
