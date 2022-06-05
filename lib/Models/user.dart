import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
  Person.fromMap(Map<String,dynamic>m ):this(m["name"],m["surname"],m["email"],m["userName"],m["password"],m["adress"]);

Map<String,dynamic> toMap(){
  return{
  "name":name,
  "surname":surname,
  "email":email,
  "userName":userName,
  "password":password,
  "adress":adress,
  };

}
  @override
  String toString() {
    return "$name $surname $email $userName $password $adress";
  }

  String fullName() => "$name $surname";
}

class UserRepository extends ChangeNotifier{
   List<Person>  users=[];
  Future<void> addUserFirebase(Person person)
  async {
    await FirebaseFirestore.instance.collection("person").add(person.toMap());
  }
  Future<void> GetUserFirebase()
   async {

    final query=await FirebaseFirestore.instance.collection("person").get();
    List<Person> list= query.docs.map((e)=>Person.fromMap(e.data())).toList();
    for(var item in list)
      {
        users.add(item);
      }

  }




}