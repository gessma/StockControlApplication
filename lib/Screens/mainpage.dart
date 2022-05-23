import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ne_nerede/Models/category.dart';
import 'package:ne_nerede/Models/item.dart';



import 'AddİtemPage.dart';

class mainpage extends StatefulWidget {
  final String categoryname;

 const mainpage(this.categoryname, {Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  CategoryRepository categoryRepository=CategoryRepository();
  // late item _item;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:Text("Ürün Listesi",
        style: TextStyle(color: Colors.white),) ,

    ),
    body:  Center(
    child: Padding( padding: const EdgeInsets.only(top: 10.0),
      child: Text(_item.itemname),


      
    ),
    ),
    drawer:Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: [

     DrawerHeader(
    decoration: BoxDecoration(
    color: Colors.blue),
    child: Text(widget.categoryname),),
    ListTile(
    title: const Text("Ürün Ekle"),
    onTap: () async {
      final category=categoryRepository.GetCategorybyCategoryName(widget.categoryname);

      /*_item=*/await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItemPage(category)));
    },
    ),
    ],
    ) ,
    ),


    );
  }
}
