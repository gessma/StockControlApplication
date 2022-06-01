import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ne_nerede/Models/category.dart';
import 'package:ne_nerede/Models/item.dart';



class AddItemPage extends StatefulWidget {
  final Category? category;
  const AddItemPage( this.category, {Key? key}) : super(key: key);


  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController itemnameController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController supplyDateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeController = TextEditingController();
   ItemRepository _itemRepository = ItemRepository();
  final GlobalKey<FormState> formkey = GlobalKey();
   var LastDate;
  var FirstDate;
  Unit? unit;
  static Unit? Dropdownvalue=Unit.values.elementAt(0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün ekle")),
          body: Form(
            key: formkey,
            child:Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                  children: <Widget>[
              Container(
              alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Ürünün Bilgilerini Giriniz',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
              ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextFormField(
                        controller: itemnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ürün adı',
                        ),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Boş bırakılamaz!";
                            }
                            if (int.tryParse(value) != null) {
                              return "sadece harften  oluşmalı!";
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextFormField(
                        // obscureText: true,
                        controller: brandController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ürünün markası',
                        ),
                        // validator:(value) {
                        //   if (value !=
                        //       expirationDateController.text)
                        //   {
                        //     return "Giridiğiniz şifre eşleşmiyor";
                        //   }
                        // },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextFormField(
                        controller: subCategoryController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ürünün Kategorisi (örn:Süt Ürünleri)',
                        ),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Boş bırakılamaz!";
                            }
                            if (int.tryParse(value) != null) {
                              return "sadece harften  oluşmalı!";
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextFormField(
                        controller: typeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ürün tipi(örn:içecek)',
                        ),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Boş bırakılamaz!";
                            }
                            if (int.tryParse(value) != null) {
                              return "sadece harften  oluşmalı!";
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextFormField(
                        controller: amountController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ürünün miktarı',
                        ),
                        validator: (value){

                          if (value != null) {
                            if (value.isEmpty) {
                              return "Boş bırakılamaz!";
                            }
                          }


                        },

                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    //   child:  Dropdown(),
                    //
                    //
                    //
                    // ),
                    Container(
                      child: DropdownButtonFormField<Unit>(items:Unit.values.map((Unit value) {
                        return DropdownMenuItem<Unit>(
                            value: value,
                            child: Text( UnittoString(value)));
                      }).toList(),
                        value: Dropdownvalue,
                          onChanged:(value) {
                            setState(() {
                              unit = value;

                            });
                          },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextButton(

                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5),
                              maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                                FirstDate=date;
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
                              }, currentTime: DateTime.now(), locale: LocaleType.tr);
                        },

                        child: Text(
                          'Ürünü Tedarik ettiğiniz tarihi seçiniz',
                          style: TextStyle(color: Colors.blue),
                        ),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextButton(


                        onPressed: () {

                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5),
                              maxTime: DateTime(2019, 6, 7),
                              onChanged: (date) {
                                 LastDate=date;
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
                              }, currentTime: DateTime.now(), locale: LocaleType.tr);
                        },
                        child: Text(
                          'Ürünün Son Kullanma tarihini seçiniz',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Kaydet'),
                        onPressed: () {
                          setState(() {
                            if (formkey.currentState!.validate()) {
                              item Item = item(
                                  itemnameController.text,
                                  widget.category,
                                  LastDate,
                                  FirstDate,
                                  double.parse(amountController.text),
                                  unit,
                                  brandController.text,
                                  subCategoryController.text,
                                  typeController.text);
                              _itemRepository.AddItem(Item);

                              Navigator.of(context).pop(Item);
                              print(Item.itemname);
                            }
                          }
                          );
                        }
                      ),
                    ),

                  ],
              ),
            ),


            ),



    );
     



  }
}
 class Dropdown extends StatefulWidget {
   const Dropdown({Key? key}) : super(key: key);

   @override
   State<Dropdown> createState() => _DropdownState();
 }

 class _DropdownState extends State<Dropdown> {
   static Unit? Dropdownvalue=Unit.values.elementAt(0);
   @override
   Widget build(BuildContext context) {
     return Row(
       children: [
         Text("Lüften Birim seçiniz:   "),
         DropdownButtonFormField<Unit>(

           value: Dropdownvalue,
           onChanged: ( value) {
             setState(() {
               Dropdownvalue = value;

             });
           },
           items: Unit.values.map((Unit value) {
             return DropdownMenuItem<Unit>(
                 value: value,
                 child: Text( UnittoString(value)));
           }).toList(),
validator: (value){

  if (value == null) {

    return "Boş bırakılamaz!";
  }



          },
        ),
      ],
    );

  }
}
String UnittoString( Unit unit)
{
  String Result="";
  switch(unit)
  {
    case Unit.ml:
      Result= "Mililitre";
      return  Result;
    case Unit.g:
      Result= "Gram";
      return  Result;
    case Unit.adet:
      Result= "Tane";
      return  Result;
  }


}


