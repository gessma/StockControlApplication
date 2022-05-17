import 'package:flutter/material.dart';

import '../Models/category.dart';

class Categoriespage extends StatefulWidget {
  const Categoriespage({Key? key}) : super(key: key);

  @override
  State<Categoriespage> createState() => _CategoriespageState();
}

class _CategoriespageState extends State<Categoriespage> {
  TextEditingController CategoryNameController = TextEditingController();
 late final List<Category> categories=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategoriler',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 20,
            ),

            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                            child: TextField(
                              controller: CategoryNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Kategori Adı',
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                                onPressed:() {


                                },
                              child: const Text('Oluştur'),
                            ) ,

                          ),


                        ],
                      );
                    });
              },
              padding:
              EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              color: Colors.pink,
              child: Text(
                '+ Kategori Ekle',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
