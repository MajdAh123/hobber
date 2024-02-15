import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodosApi {
  String serverUrl = "https://emergingideas.ae/test_apis/";

  Future<List<Todo>> getAllTodos() async {
    try {
      String url = "$serverUrl/read.php?email=majd.b@gmail.com";

      var response = await http.get(Uri.parse(url));
      List body = jsonDecode(response.body);
      List<Todo> todos = body
          .map(
            (dynamic item) => Todo.fromJson(item),
          )
          .toList();

      return todos;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<String> deleteTodo(int id) async {
    String myUrl = "$serverUrl/delete.php?email=majd.b@gmai.com&id=$id";
    http.Response response = await http.get(Uri.parse(myUrl));
    print(response.body);
    return response.body;
  }

  Future<Todo> getTodoById(int id) async {
    String myUrl = "$serverUrl/read.php?email=majd.b@gmai.com&id=$id";
    http.Response response = await http.get(Uri.parse(myUrl));

    Todo advertisment = Todo.fromJson(jsonDecode(response.body));

    return advertisment;

    // return note;
  }

  Future<String> insertTodo(Todo todo) async {
    var myUrl = Uri.parse(serverUrl + "create.php");
    DateTime now = DateTime.now();

    final response = await http.post(myUrl,
        body: json.encode({
          "date": DateFormat("yyyy-MM-dd HH:mm:ss").format(now),
          "title": todo.title,
          "description": todo.description,
          "img_link": "https://randomuser.me/api/portraits/thumb/men/5.jpg",
          'email': todo.email
        }));
    print(response.body);
    return response.body;
    // print("Book Added");
    // await getlist();
    // print(response.statusCode);
    // print(response.body);
  }

  Future<String> updateTodo(Todo todo) async {
    String myUrl =
        "$serverUrl/edit.php?email=${todo.email}&id=${todo.id}&description=${todo.description}&title=${todo.title}&img_link=${todo.img_link}";
    http.Response response = await http.get(Uri.parse(myUrl));
    // await getlist();
    // print(response.body);
    return response.body;
  }
}
