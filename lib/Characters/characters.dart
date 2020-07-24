import 'dart:convert';
import 'package:harry_potter_app/Data/charactersdata.dart';
import 'package:harry_potter_app/Characters/charactersdetail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  Characters ch;
  List data;
  @override
  void initState() {
    super.initState();
    fetchdetail();
  }

  Future<void> fetchdetail() async {
    var res = await http.get("http://hp-api.herokuapp.com/api/characters");

    var decodeRes = jsonDecode(res.body);

    ch = Characters.fromJson(decodeRes[0]);
    data = decodeRes;
    print(decodeRes);
    if(mounted){setState(() {});}
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Harry Potter',
           style: TextStyle(fontFamily: 'Harry Potter',fontSize: 40),),
          elevation: 7,
          centerTitle: true,
        ),
        body: ch == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                      onTap: () => Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => CharacterDetails(data :data,index: index,))) ,

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                          elevation: 7,
                          margin: EdgeInsets.all(10),
                          child: Padding( padding: EdgeInsets.all(20),
                             
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:CrossAxisAlignment.stretch,      
                                  children: <Widget>[
                                    Hero(
                                        tag: data[index]['image'],
                                        child: Image(
                                        image: NetworkImage(
                                        data[index]['image']),
                                        alignment: Alignment.center,
                                        height: 250,width: 250,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      data[index]['name'],
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ]))));
                }));
  }
}
