


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

class CategoryRepository{
 List<Category>  categories= [
Category("Buzdolabı", User("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince")),
  Category("Kiler", User("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince"))



];

 List<Category> GetCategorybyUser(User user) {
   List<Category> categoriesbyUser=[];

   for( var item in categories)
     {
       if(item.user.userName==user.userName)
         {
           categoriesbyUser.add(item);
         }

     }


    return categoriesbyUser;
 }


}