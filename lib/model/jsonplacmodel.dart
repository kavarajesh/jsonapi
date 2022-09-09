// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


//responce in Array from

/*
   [
  {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "sunt qui excepturi placeat culpa"
  },
  {
    "userId": 1,
    "id": 3,
    "title": "omnis laborum odio"
  },
  {
    "userId": 1,
    "id": 4,
    "title": "non esse culpa molestiae omnis sed optio"
  },
  {
    "userId": 1,
    "id": 5,
    "title": "eaque aut omnis a"
  }]
    */
class Welcome1 {
  Welcome1({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  factory Welcome1.fromJson(Map<String, dynamic> json) => Welcome1(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

}
