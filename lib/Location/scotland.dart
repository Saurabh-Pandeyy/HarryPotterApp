import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Scotland extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Harry Potter',
           style: TextStyle(fontFamily: 'Harry Potter',fontSize: 40),),
          elevation: 7,
          centerTitle: true,
        ),
        body: Container(

          child: FutureBuilder(
            future: DefaultAssetBundle.of(context) .loadString('lib/Data/scotland.json'),
             builder: (context, snapshot) {
              var data = jsonDecode(snapshot.data.toString());
              
            
              return ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                          
                          margin: EdgeInsets.all(10),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              SizedBox(height: 20,),

                              Text(data[index]['name'],
                              style: GoogleFonts.girassol(textStyle:
                              TextStyle(fontSize: 24,fontWeight:FontWeight.bold,
                              letterSpacing: 5,decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.underline
                              )) ),
                              SizedBox(height: 20,),

                              Align(
                                alignment: Alignment.center,
                                child:
                                 Image.network(
                                  data[index]['img1'],
                                  fit: BoxFit.contain,
                                  loadingBuilder: (context,child,load){
                                    if(load == null)
                                    return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: load.expectedTotalBytes != null 
                                        ? load.cumulativeBytesLoaded / load.expectedTotalBytes
                                        : null,
                                      ),
                                    );
                                  },),
                              ),
                              SizedBox(height: 20,),
                              
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                  TextSpan(text:"Movie -  ",
                                  style: GoogleFonts.cairo(textStyle:
                                  TextStyle(fontSize: 16,fontWeight:FontWeight.bold,))),
                                  
                                  TextSpan(text:data[index]['movie'],
                                  style: GoogleFonts.forum(textStyle:
                                  TextStyle(fontSize: 16,)) )
                                  
                                ]),                             
                               ),
                              SizedBox(height: 10,), 

                             RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                  TextSpan(text:"Shot -  ",
                                  style: GoogleFonts.cairo(textStyle:
                                  TextStyle(fontSize: 16,fontWeight:FontWeight.bold,))),
                                  
                                  TextSpan(text:data[index]['shot'],
                                  style: GoogleFonts.forum(textStyle:
                                  TextStyle(fontSize: 16,)) )
                                ]),                             
                               ),
                               SizedBox(height: 10,),        

                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children:[
                                  TextSpan(text:"Fact -  ",
                                  style: GoogleFonts.cairo(textStyle:
                                  TextStyle(fontSize: 16,fontWeight:FontWeight.bold,))),
                                  
                                  TextSpan(text:data[index]['fact'],
                                  style: GoogleFonts.forum(textStyle:
                                  TextStyle(fontSize: 16,)) )
                                ]),                             
                               ),    
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children:[
                                  TextSpan(text:"How to get there -  ",
                                  style: GoogleFonts.cairo(textStyle:
                                  TextStyle(fontSize: 16,fontWeight:FontWeight.bold,))),
                                  
                                  TextSpan(text:data[index]['way'],
                                  style: GoogleFonts.forum(textStyle:
                                  TextStyle(fontSize: 16,)) )
                                ]),                             
                               ),    
                              
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children:[
                                  TextSpan(text:"Price -  ",
                                  style: GoogleFonts.cairo(textStyle:
                                  TextStyle(fontSize: 16,fontWeight:FontWeight.bold,))),
                                  
                                  TextSpan(text:data[index]['price'],
                                  style: GoogleFonts.forum(textStyle:
                                  TextStyle(fontSize: 16,)) )
                                ]),                             
                               ),    
                                
                              SizedBox(height: 10,),
                              
                            ],
                          ),
                  );
               });
          })));
  }
}