import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = Uri.https('jsonplaceholder.typicode.com','/photos');
  var data;

  @override
  void initState(){ 
    super.initState();
    fetchData();
  }

  fetchData() async{
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Simple App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: (){
              Navigator.pop(context);
          })
        ]
      ),
      body: data != null ?
        ListView.builder(
          itemBuilder: (context, index){
            return ListTile(
              title: Text(data[index]["title"]),
              subtitle: Text("ID: ${data[index]["id"]}"),
              leading: Image.network(data[index]["url"])
            );
            }, 
          itemCount: data.length)
        : 
        Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.send_rounded),
      ),
    );
  }
}

