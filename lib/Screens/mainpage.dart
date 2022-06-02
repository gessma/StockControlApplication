import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ne_nerede/Models/category.dart';
import 'package:ne_nerede/Models/item.dart';


import 'AddİtemPage.dart';

class mainpage extends StatefulWidget {
  final String categoryname;

  const mainpage(this.categoryname,{Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}
// kategori adına göre itemler çekilmeli
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
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListedItem(itemRepository),
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
                setState(()
                {
                  itemRepository.items.add(_item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListedItem extends StatelessWidget {
  final ItemRepository itemRepository;
  const ListedItem(this.itemRepository ,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Data="henüz bir veri eklenmemiş";
    return Expanded(child: itemRepository.items.isEmpty ? Center(child: Text(Data)):
          ListView.separated(itemBuilder: (context, index)
          {
            Data=itemRepository.items[index].itemname;

            return ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  // Navigator.pop(context, MaterialPageRoute(builder: (context)=>mainpage(Data)));

                }, child: Text(Data));




          },

              separatorBuilder: (context, index) => Divider(), itemCount: itemRepository.items.length));




  }
}


