import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:harry_potter_app/Movies/moviedetails.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Harry Potter',
           style: TextStyle(fontFamily: 'Harry Potter',fontSize: 40)),
          elevation: 7,
          centerTitle: true,
        ),
        body: Container(

          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('lib/Data/movies.json'),
             builder: (context, snapshot) {
              var data = jsonDecode(snapshot.data.toString());
              
            
              return ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(

                    onTap: () => Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => MovieDetails(data :data,index: index,))) ,

                    child: Card(
                            elevation: 7,
                            margin: EdgeInsets.all(10),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child:
                                     Image.network(
                                      data[index]['image'],
                                      width:250 , height:250),
                                  ),
                                  
                                      Positioned(
                                      left: 0.0,top: 0.0,
                                      child: Container(
                                      padding: EdgeInsets.all(7),
                                      child: Text(
                                      
                                      data[index]['number'],
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.visible,), 
                                      color: Colors.red     
                                    
                                    ),)]),
                                SizedBox(height: 10,),
                                Text(
                                    data[index]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)    
                                    ),
                                SizedBox(height: 10,)
                          
                              ],
                            ),
                    ),);
               });
          })));
  }
}

