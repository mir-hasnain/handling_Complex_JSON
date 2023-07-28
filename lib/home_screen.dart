import 'dart:convert';

import 'package:complex_json/components/MyRow.dart';
import 'package:complex_json/models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int iterator = 0;
  List<Color> colorArr = [Colors.black,Colors.deepOrange,Colors.green,Colors.blue,Colors.teal,Colors.deepPurpleAccent,Colors.limeAccent,Colors.pink];
  bool isHover = false;
  List<UserModel> userList = [];
  Future<List<UserModel>> getUsers() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.airplane,color: Colors.black87,),
            Text('    Playing with complex JSON    '),
            Icon(CupertinoIcons.airplane,color: Colors.black87,)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future:getUsers(),builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
              return ListView.builder(itemCount:userList.length,itemBuilder: (context,index){
                if(index%2 == 0){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: (){
                      if(iterator >= colorArr.length-1)
                      {
                        iterator%=(colorArr.length-1);
                      }else{
                        iterator++;
                      }
                      setState(() {
                      });
                    },
                    child: Container(
                      height:200,
                      width: 250,
                      decoration: BoxDecoration(
                        color: colorArr[iterator],
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.white,
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyRow(title: 'ID', value: snapshot.data![index].id.toString()),
                          MyRow(title: 'Name', value: snapshot.data![index].name.toString()),
                          MyRow(title: 'Email', value: snapshot.data![index].email.toString()),
                          MyRow(title: 'Address,city', value: snapshot.data![index].address!.city.toString()),
                          MyRow(title: 'Address,geo,Lattitude', value: snapshot.data![index].address!.geo!.lat.toString()),
                          MyRow(title: 'Address,geo,Longitude', value: snapshot.data![index].address!.geo!.lng.toString()),
                        ],
                      ),
                    ),
                  ),
                );
                }else{
                  return const SizedBox(height: 20,);
                }
              });
            }),
          )
        ],
      ),
    );
  }
}
