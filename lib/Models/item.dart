import 'package:ne_nerede/Models/category.dart';
import 'package:ne_nerede/Models/user.dart';


class item {
  String itemname;
  Category? category;
  DateTime expirationDate;
  DateTime supplyDate;
  double Amount;
  Unit? unit;
  String? brand;
  String? subCategory;
  String? description;
  String Type;

  item(this.itemname, this.category, this.expirationDate, this.supplyDate,
      this.Amount, this.unit, this.brand, this.subCategory, this.Type);
}
enum Unit
{
ml,
adet,
  g,
}
class ItemRepository{
  List<item>  items= [
    item("Süt",Category("Buzdolabı", User("caner", "kale", "a@gmail.com", "kalecaner", "12345", "derince")),DateTime(2022,05,21), DateTime.now(), 2000,Unit.ml , "Sütaş", "süt ürünleri", "içecek"),
    ];
  void AddItem(item Item)
  {
items.add(item(Item.itemname, Item.category, Item.expirationDate, Item.supplyDate, Item.Amount, Item.unit, Item.brand, Item.subCategory, Item.Type));
  }


}
