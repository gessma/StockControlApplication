


import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ne_nerede/Models/user.dart';

class Category{
  String categoryname;
  Person user;

  Category(this.categoryname, this.user);

  @override
  String toString() {
    return 'category{categoryname: $categoryname, user: $user}';
  }

}

class CategoryRepository {
  List<Category>  categories= [
    Category("Buzdolabı", Person("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince")),
    Category("Kiler", Person("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince"))



  ];


  List<Category> GetCategorybyUser(Person user) {
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
Category? GetCategorybyCategoryName(String Categoryname)
{  Category? category;
    if(categories.isNotEmpty)
      {
        for( var item in categories)
        {
          if(item.categoryname==Categoryname)
          {
           category=item;
          }
          else{
            category=null;
          }
        }

      }
    return category;
}

}

