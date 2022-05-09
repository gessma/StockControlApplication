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
