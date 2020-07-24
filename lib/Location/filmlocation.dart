import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter_app/Location/england.dart';
import 'package:harry_potter_app/Location/london.dart';
import 'package:harry_potter_app/Location/scotland.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('Harry Potter',
           style: TextStyle(fontFamily: 'Harry Potter',fontSize: 40),),
          elevation: 7,
          centerTitle: true,
      ),
      body: Center(child: 
      Container(
        child: ListView(
          children: <Widget>[
          
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () =>
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => London())),
                child: Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage('lib/Images/london.jpeg'),
                        fit: BoxFit.fitWidth,),

                        SizedBox(height: 7,),

                        Text('LONDON',
                        style: GoogleFonts.merienda(
                          textStyle: TextStyle(fontSize: 20)
                      
                    ),),
                    SizedBox(height: 7,),
                ],),
                  )),
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute (
                    builder: (context) => England()
                  )),
                  child: Card(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage('lib/Images/england.jpeg'),
                        fit: BoxFit.fitWidth,),

                        SizedBox(height: 7,),
                        
                        Text('ENGLAND',
                        style: GoogleFonts.merienda(
                          textStyle: TextStyle(fontSize: 20)
                      
                    ),),
                    SizedBox(height: 7,),
                ],),
                  )),
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute 
                  (builder: (context) => Scotland())),
                  child: Card(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage('lib/Images/scotland.jpeg'),
                        fit: BoxFit.fitWidth,),

                        SizedBox(height: 7,),
                        
                        Text('SCOTLAND',
                        style: GoogleFonts.merienda(
                          textStyle: TextStyle(fontSize: 20)
                      
                    ),),
                    SizedBox(height: 7,),
                ],),
                  )),
              ),
            ),
          ],),
      ),),
      
    );
  }
}