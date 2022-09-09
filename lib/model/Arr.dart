class Arr {
  Arr({
      this.userId, 
      this.id, 
      this.title,});

  Arr.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
  int? userId;
  int? id;
  String? title;
}