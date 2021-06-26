import 'package:flutter/material.dart';
import 'package:achieve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:achieve/screens/quote_screen.dart';
import 'package:achieve/quotes/quote_data.dart';
import 'package:achieve/components/components.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool initial = true;
  var categories = {
    'life': lifeQuotes,
    'fitness': fitnessQuotes,
    'finance': financeQuotes,
    'wisdom': wisdomQuotes,
    'business': businessQuotes,
    'study': studyQuotes,
    'mindfulness': mindfulnessQuotes
  };
  List displayList;

  void onItemTap(String catName) {
    setState(() {
      initial = false;
      displayList = categories[catName];
    });
  }

  @override
  Widget build(BuildContext context) {
    return initial
        ? Column(
            children: <Widget>[
              Header('Categories', FontAwesomeIcons.list),
              divider,
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Category('Life', () => onItemTap('life')),
                      Category('Business', () => onItemTap('business')),
                      Category('Finance', () => onItemTap('finance')),
                      Category('Fitness', () => onItemTap('fitness')),
                      Category('Wisdom', () => onItemTap('wisdom')),
                      Category('Study', () => onItemTap('study')),
                      Category('Mindfulness', () => onItemTap('mindfulness')),
                    ],
                  ),
                ),
              ),
              divider,
            ],
          )
        : QuoteScreen(quotes: displayList);
  }
}

class Category extends StatelessWidget {
  Category(this.name, this.press);
  final String name;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 15, right: 15),
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
