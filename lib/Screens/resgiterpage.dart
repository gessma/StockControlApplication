import 'package:flutter/material.dart';
import 'package:ne_nerede/Models/user.dart';



//void main() => runApp(const Registerpage());
class Registerpage extends StatelessWidget {
  const Registerpage({Key? key}) : super(key: key);

  static const String _title = 'Ne&Nerede';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      );

  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  TextEditingController AdressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Hesap Oluştur',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adı',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: surnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Soyad',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: mailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kullanıcı Adı',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifre',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordCheckController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifre Onayla',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(

                controller: AdressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adres',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Üye Ol'),
                  onPressed: () {
                    if (passwordController.text ==
                        passwordCheckController.text) {
                      User new_user = User(
                          nameController.text, surnameController.text,
                          mailController.text, usernameController.text,
                          passwordController.text, AdressController.text);
                      print(new_user);
                      Navigator.of(context).pop(new_user);

                    }
                    else
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                child: Text("Bir hata oluştu"),
                              ),
                            );
                          }),
                        );
                      }
                  }),
            ),
          ],
        ));
  }
}