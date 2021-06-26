import 'package:flutter/material.dart';
import 'package:achieve/components/components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:achieve/constants.dart';
import 'package:achieve/components/todo.dart';
import 'dart:async';
import 'package:achieve/components/data_access.dart';
import 'package:achieve/screens/add_item.dart';

class GoalScreen extends StatefulWidget {
  GoalScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  List<TodoItem> _todoItems = List();
  DataAccess _dataAccess;

  _GoalScreenState() {
    _dataAccess = DataAccess();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataAccess.open().then((result) {
      _dataAccess.getTodoItems().then((r) {
        setState(() {
          _todoItems = r;
        });
      });
    });
  }

  Widget _createTodoItemWidget(TodoItem item) {
    // TODO customize todo item display to show completion status
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Icon(
          Icons.circle,
          color: Colors.white,
          size: 10,
        ),
      ),
      title: Text(
        item.name,
        style: kGoalText,
      ),
      contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 5.0),
      trailing: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xff6b778d)),
        child: Checkbox(
          checkColor: Colors.white,
          activeColor: Color(0xffff6768),
          value: item.isComplete,
          onChanged: (value) => _updateTodoCompleteStatus(item, value),
        ),
      ),
      onLongPress: () => _displayDeleteConfirmationDialog(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoItemWidgets = _todoItems.map(_createTodoItemWidget).toList();
    return Column(
      children: <Widget>[
        Header('My Goals', FontAwesomeIcons.checkCircle),
        divider,
        Expanded(
          child: Container(
            child: ListView(
              children: todoItemWidgets,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 20),
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xff6b778d),
                    size: 45,
                  ),
                  onPressed: _displayInfo),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 20),
              alignment: Alignment.bottomRight,
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    color: Color(0xff6b778d),
                    size: 45,
                  ),
                  onPressed: _addTodoItem),
            ),
          ],
        ),
        divider,
      ],
    );
  }

  Future<Null> _displayDeleteConfirmationDialog(TodoItem item) {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true, // Allow dismiss when tapping away from dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete Goal"),
            content: Text("Do you want to delete \"${item.name}\"?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: Navigator.of(context).pop, // Close dialog
              ),
              FlatButton(
                child: Text("Delete"),
                onPressed: () {
                  _deleteTodoItem(item);
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
            ],
          );
        });
  }

  Future<Null> _displayInfo() {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true, // Allow dismiss when tapping away from dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("The importance of setting goals"),
            content: Text(
              "The seniors of a 1979 class were asked if they had written their goals upon graduation. Only 3% had written goals, 13% had goals, but not in writing, and the rest had no goals at all. Ten years later, the researchers surveyed the members of that class and discovered that the 13% with unwritten goals were earning on average twice as much as the 84% of goal-less students. The 3% of students with written goals were earning on average 10 times as much as the other 97%. Writing down your goals can help you to focus on what you want and stay motivated.",
              textAlign: TextAlign.justify,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close_rounded),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
            ],
          );
        });
  }

  void _updateTodoCompleteStatus(TodoItem item, bool newStatus) {
    item.isComplete = newStatus;
    _dataAccess.updateTodo(item);
    _dataAccess.getTodoItems().then((items) {
      setState(() {
        _todoItems = items;
      });
    });
  }

  void _deleteTodoItem(TodoItem item) {
    _dataAccess.deleteTodo(item);
    _dataAccess.getTodoItems().then((items) {
      setState(() {
        _todoItems = items;
      });
    });
  }

  void _addTodoItem() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTodoItemScreen()));
    _dataAccess.getTodoItems().then((r) {
      setState(() {
        _todoItems = r;
      });
    });
  }
}
