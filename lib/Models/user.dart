import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  String name;

  String surname;

  String email;

  String userName;

  String password;

  String adress;

  User(this.name, this.surname, this.email, this.userName, this.password,
      this.adress);


  @override
  String toString() {
    return "$name $surname $email $userName $password $adress";
  }

  String fullName() => "$name $surname";
}

class UserRepository extends ChangeNotifier{
  final List<User>  users= [
    User("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince"),
    User("yorum", "kale", "y@gmail.com", "yck", "1234", "derince"),

      ];


}