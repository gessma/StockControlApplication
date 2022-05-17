import 'package:flutter/material.dart';
import '../Models/category.dart';
import '../Models/user.dart';

class Categoriespage extends StatefulWidget {
final  User user;
  const Categoriespage( this.user, {Key? key}) : super(key: key);


  @override
  State<Categoriespage> createState() => _CategoriespageState();



}

class _CategoriespageState extends State<Categoriespage> {
  TextEditingController CategoryNameController = TextEditingController();
  CategoryRepository categoryRepository=CategoryRepository();
  int count=0;





  @override
  Widget build(BuildContext context) {
print("Kategori sayfası");


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
                Column(
                  children: [
                    const Text("Hoş geldin Kalbin kadar temiz bir sayfa görüyorsan hemen bir kategori oluştur"),
                  ],
                ),


            Expanded(child: ListView.separated(itemBuilder: (context,index) {
              String categoryname="Henüz kategori oluşturulmamış";

              if (categoryRepository.GetCategorybyUser(widget.user)!=null) {
                categoryname=categoryRepository.GetCategorybyUser(widget.user)[index].categoryname;
                count=categoryRepository.GetCategorybyUser(widget.user).length;
                print("$categoryname");

                return  ElevatedButton(onPressed: () {}, child: Text("$categoryname"));
              }
              else
                {
                  return  Text("$categoryname");
                }


            }, separatorBuilder: (context,index)=>Divider(), itemCount: count)




            ),



    //
    // ),

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

// class ButtonList extends StatelessWidget {
//   const ButtonList({
//     Key? key,
//     required this.categoryRepository,
//     required this.widget,
//
//   }) : super(key: key);
//
//   final CategoryRepository categoryRepository;
//   final Categoriespage widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemCount:categoryRepository.GetCategorybyUser(widget.user).length,
//         itemBuilder: (context,index)
//       {
//         String categoryname=categoryRepository.GetCategorybyUser(widget.user)[index].categoryname;
//         return  ElevatedButton(onPressed: () {}, child: Text("$categoryname"));
//       });
//   }
// }
