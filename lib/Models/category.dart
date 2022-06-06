



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ne_nerede/Models/user.dart';

class Category{
  String categoryname;
  Person user;

  Category(this.categoryname, this.user);
  Category.fromMap(Map<String,dynamic>m ):this(m["categoryname"],m["user"]);
  Map<String,dynamic> toMap() {
    return {
      "categoryname": categoryname,
      "user": user,

    };
  }


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
  Future<void> addCategoryFirebase(Category category)
  async {
    await FirebaseFirestore.instance.collection("person").add(category.toMap());
  }
  Future<void> GetcategoryFirebase()
  async {

    final query=await FirebaseFirestore.instance.collection("category").get();
    List<Category> list= query.docs.map((e)=>Category.fromMap(e.data())).toList();
    for(var item in list)
    {
      categories.add(item);
    }

  }

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

