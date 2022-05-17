import 'package:flutter/material.dart';
import 'package:ne_nerede/Models/user.dart';




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
  UserRepository userRepository=UserRepository();
  final GlobalKey<FormState> formkey=GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
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
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adı',
                  ),
                validator: (value){
                    if(value!=null)
                      {
                        if(value.isEmpty)
                          {
                            return "Boş bırakılamaz!";
                          }
                        if(int.tryParse(value)!=null)
                          {
                            return "sadece harften  oluşmalı!";
                          }
                      }
                },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Soyad',
                  ),
                  validator: (value){
                    if(value!=null)
                    {
                      if(value.isEmpty)
                      {
                        return "Boş bırakılamaz!";
                      }
                      if(int.tryParse(value)!=null)
                      {
                        return "sadece harften  oluşmalı!";
                      }
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  controller: mailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mail',
                  ),
                  validator: (value){
                    for (var user in userRepository.users) {
                      if(value==user.email)
                      {
                        return "Bu mail bende mevcut daha önce kayıt olmuşsun güzellik";
                      }

                    }
                },

                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kullanıcı Adı',
                  ),
                     validator: (value){
                       for (var user in userRepository.users) {
                         if(value==user.userName)
                         {
                           return "Malesef bu kullanıcı adı daha önce kullanılmış";
                         }

                       }

                     },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                  ),
                    validator:(value) {
                      if (value !=
                          passwordCheckController.text)
                      {
                        return "Giridiğiniz şifre eşleşmiyor";
                      }
                    },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordCheckController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre Onayla',
                  ),
                  validator:(value) {
                    if (value !=
                        passwordController.text)
                    {
                      return "Giridiğiniz şifre eşleşmiyor";
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(

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
                      if(formkey.currentState!.validate())
                        {
                          User new_user = User(
                              nameController.text, surnameController.text,
                              mailController.text, usernameController.text,
                              passwordController.text, AdressController.text);
                               userRepository.users.add(new_user);
                          formkey.currentState!.save();
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
                          Future.delayed(const Duration(seconds: 2),()
                          {
                            Navigator.of(context).pop();
                          });

                        }
                    }),
              ),
            ],
          )),
    );
  }
}
// void _saveUser()
// {
//   i
// }