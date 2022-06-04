import 'package:flutter/foundation.dart';


class Person {
  String name;

  String surname;

  String email;

  String userName;

  String password;

  String adress;

  Person(this.name, this.surname, this.email, this.userName, this.password,
      this.adress);


  @override
  String toString() {
    return "$name $surname $email $userName $password $adress";
  }

  String fullName() => "$name $surname";
}

class UserRepository extends ChangeNotifier{
  final List<Person>  users= [
    Person("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince"),
    Person("yorum", "kale", "y@gmail.com", "yck", "1234", "derince"),

      ];


}