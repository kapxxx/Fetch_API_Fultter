import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//fetch multiple data from api for that
// change url for api
//   create list variable and
//   used Listview.builder


void main()
{
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(),);
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Map mapresponse;
  late Map dataresponse;
  late List listitems;
  Future callApi() async{
    Response response=await get(Uri.parse('https://reqres.in/api/users?page=2')); //this is used to fatch data from api
    if(response.statusCode==200) //we are cheching status code
      {
        setState((){
          print(response.body);
          mapresponse =json.decode(response.body);
          listitems=mapresponse['data'];
        });
      }
  }

  void initState(){
    callApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('User data'),),
    // body: Container(
    //   child: listitems==null?Text('loding'): Text(listitems[0]['id'].toString()),),);
    
    body: ListView.builder(
      itemCount: listitems.length,
        itemBuilder: (context,index){
      return Container(
      child: Column(
      children: [
        Text(listitems[index]['email'].toString()),
        Image.network(listitems[index]['avatar']),

    ],),);
    } ));
    
  }
}
