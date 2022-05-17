
import 'package:ne_nerede/Models/user.dart';

class Category{
  String categoryname;
  User user;

  Category(this.categoryname, this.user);

  @override
  String toString() {
    return 'category{categoryname: $categoryname, user: $user}';
  }

}

