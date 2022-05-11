import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ne_nerede/Screens/resgiterpage.dart';

import 'Models/user.dart';
import 'Screens/category_page.dart';




void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Ne&Nerede';






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(

        ),
      ),
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
  late User user;


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
                  'Hoş Geldin',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kullanıcı Adı',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifre',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
                
              },
              child: const Text('Şifremi unuttum',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Giriş Yap'),
                  onPressed: () {
                    if(nameController.text==user.userName && passwordController.text==user.password)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Categoriespage()));
                        print("Giriş yapıldı.");
                      }
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Hala bir hesabın yok mu?'),

                TextButton(

                  child: const Text(
                    'Hemen üye ol!',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                     user=await Navigator.push(context, MaterialPageRoute(builder: (context)=>Registerpage()));
                   print(user);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
         Container(
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
             child:SignInButton(
               Buttons.Google,
               text: "Sign up with Google",
               onPressed: () {},
             )

         ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child:SignInButton(
                  Buttons.Facebook,
                  text: "Sign up with Facebook",
                  onPressed: () {


                  },
                )

            ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child:SignInButton(
                  Buttons.Apple,
                  text: "Sign up with Apple",
                  onPressed: () {},
                )

            )
          ],
        ));
  }
}