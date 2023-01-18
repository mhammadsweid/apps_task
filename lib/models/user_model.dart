class User {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  User({this.id, this.title, this.firstName, this.lastName, this.picture});

  User fromJson(Map<String, dynamic> user) {
    return User(

    id : user['id'],
    title :user['title'],
    firstName : user['firstName'],
    lastName : user['lastName'],
    picture :user['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['picture'] = this.picture;
    return data;
  }
}
