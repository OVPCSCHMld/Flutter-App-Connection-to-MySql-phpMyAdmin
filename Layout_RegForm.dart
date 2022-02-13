import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:async';
import 'dart:convert';
import 'main.dart';


//create a method to get data from registration form in flutter app
//and send it to phpmyadmin
//method is async

SendData_2_DB(String data1,String data2,String data3) async {
  final response = await http.post(
    Uri.parse("http://192.168.1.127/practice_MelDB/kk10_Flutter/DB_Register.php"),
    body: {
      "id": data1,
      "username": data2,
      "password": data3,
    },
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return (jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //throw Exception('Failed to create album.');
    return (jsonDecode(response.body));

  }
}




class MyRegApp extends StatefulWidget {
  const MyRegApp({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<MyRegApp> {

  TextEditingController id = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Tutorial'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  child:
                  new Image.asset(
                    'assets/images/CuriosityRover.jpg',
                    fit:BoxFit.fill,
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                ),

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Proxima b Arrival Registration',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),)
                ),

                Container(
                  child:
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "ID (it is a 6 digit number)",
                                style: new TextStyle(fontSize:20),
                              )]),

                        new TextField(
                          controller: id,
                          decoration: InputDecoration(
                             border: OutlineInputBorder(),
                             labelText: 'ID',

                          ),)]

                  ),

                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: username,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'User Name',
                     ),),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),),
                ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        SendData_2_DB(id.text,username.text,password.text);
                      },
                    )),

                FlatButton(
                  onPressed: (){},
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),

                Container(
                    child: Row(
                      children: <Widget>[
                        Text('New User?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),

                Container(
                    child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(12.0),
                            padding: EdgeInsets.all(10.0),
                            decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(8),
                                color:Colors.white
                            ),
                            child:  IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.facebook),  //shopping_cart, facebook//  https://fonts.google.com/icons?selected=Material+Icons
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(60.0),
                            padding: EdgeInsets.all(10.0),
                            decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(8),
                                color:Colors.white
                            ),
                            child:     IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.email),),
                          ),

                          Container(
                            margin: EdgeInsets.all(20.0),
                            padding: EdgeInsets.all(10.0),
                            decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(8),
                                color:Colors.white
                            ),
                            child:
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart),  //shopping_cart, facebook//  https://fonts.google.com/icons?selected=Material+Icons
                            ),
                          ),

                        ]
                    )),

              ],
            )
        )
    );
  }
}

