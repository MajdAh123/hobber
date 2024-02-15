class Todo {
  int id;
  String title;
  String description;
  String img_link;
  String email;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.img_link,
      required this.email});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        img_link: json['img_link'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['img_link'] = img_link;
    data['email'] = email;
    return data;
  }
}
