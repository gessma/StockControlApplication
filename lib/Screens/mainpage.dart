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
  CategoryRepository categoryRepository = CategoryRepository();
  ItemRepository itemRepository = ItemRepository();
  late item _item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürün Listesi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
              itemCount: itemRepository.items.length,
              itemBuilder: (context, index) => Card(
                color: Colors.amber[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 4,
                child: ListTile(
                  title: Text(
                    itemRepository.items[index].itemname,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(widget.categoryname),
            ),
            ListTile(
              title: const Text("Ürün Ekle"),
              onTap: () async {
                final category = categoryRepository.GetCategorybyCategoryName(
                    widget.categoryname);

                _item = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddItemPage(category)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
