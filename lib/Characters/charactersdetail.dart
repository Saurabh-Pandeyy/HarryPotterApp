import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterDetails extends StatelessWidget {
  final data;
  final index;

  CharacterDetails({Key key, @required this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Harry Potter',
           style: TextStyle(fontFamily: 'Harry Potter',fontSize: 40),),
           elevation: 7,
           centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        Hero(
          tag: data[index]['image'],
          child: Image(
            image: NetworkImage(data[index]['image']),
            height:250,width: 250,
          ),
        ),

        Text(data[index]['name'],
        textAlign: TextAlign.center,
        style: GoogleFonts.merriweather(textStyle: 
        TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),),
         
        SizedBox(height: 20,),

        Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

         Column(
           children: <Widget>[
             Text("House" ,
             style: TextStyle(fontSize: 13, )),
             Text(data[index]['house'],
             style: GoogleFonts.archivo(textStyle: 
              TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
           ],
         ),
          Column(
            children: <Widget>[
              Text("Actor",
              style: TextStyle(fontSize: 13,)),                             
              Text(data[index]['actor'],
              style: GoogleFonts.archivo(textStyle: 
              TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
            ],
          )
        ],),
        
        ListTile(
          title: Text("Species : " + data[index]['species'],
            style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
            
        ListTile(
          title: Text("Gender : " + data[index]['gender'],
          style: TextStyle( fontSize: 20.0,fontWeight: FontWeight.bold )),
        ),  
            
        ListTile(
          title: Text( "Date Of Birth : " + data[index]['dateOfBirth'],
          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
        ), 
         
        ListTile(
          title: Text("Ancestry : " + data[index]['ancestry'],
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
        ),
                 
        ListTile(
            title: Text("Eye Colour : " + data[index]['eyeColour'],
            style: TextStyle( fontSize: 20.0,fontWeight: FontWeight.bold )),
        ),    
         
        ListTile(
          title: Text( "Hair Colour : " + data[index]['hairColour'],
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
        ),     
          
        ListTile(
          title: Text( "Wand-Core : " + data[index]['wand']['core'],
          style: TextStyle( fontSize: 20.0,fontWeight: FontWeight.bold)),
        ),   
           
        ListTile(
         title: Text("Wand-Wood : " + data[index]['wand']['wood'],
         style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),    
           
        ListTile(
         title: Text("Wand-Length : " + data[index]['wand']['length'].toString(),
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),      
            
        ListTile(
           title: Text("Patronus : " + data[index]['patronus'],
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold )),
        )    
        
                        
        
        ])
    );
  }
}                             
                                
    
