class TodoItem extends Comparable {
  final int id;
  final String name;
  bool isComplete;

  TodoItem({this.id, this.name, this.isComplete = false});

  TodoItem.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        isComplete = map["isComplete"] == 1;

  @override
  int compareTo(other) {
    if (this.isComplete && !other.isComplete) {
      return 1;
    } else if (!this.isComplete && other.isComplete) {
      return -1;
    } else {
      return this.id.compareTo(other.id);
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{"name": name, "isComplete": isComplete ? 1 : 0};
    // Allow for auto-increment
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  // Map<String, dynamic> toMap() {
  //   return {'id': id, 'title': title, 'done': done};
  // }
  //
  // Todo.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   title = map['title'];
  //   done = map['done'];
  // }

}
