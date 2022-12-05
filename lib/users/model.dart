import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.status,
    this.message,
    this.counts,
    this.users,
  });

  bool? status;
  String? message;
  int? counts;
  List<User>? users;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        status: json["Status"],
        message: json["Message"],
        counts: json["Counts"],
        users: List<User>.from(json["Users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Counts": counts,
        "Users": List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class User {
  User(
      {this.id,
      this.username,
      this.lastname,
      this.rol,
      this.phone,
      this.email,
      this.password,
      this.image});

  int? id;
  String? username;
  String? lastname;
  String? rol;
  String? phone;
  String? email;
  String? password;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        lastname: json["lastname"],
        rol: json["rol"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "lastname": lastname,
        "rol": rol,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
