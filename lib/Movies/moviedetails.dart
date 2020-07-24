import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends StatelessWidget {
  final data;
  final index;

MovieDetails({Key key, @required this.data, this.index}) : super(key: key);
 
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
        child: ListView(children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[

              ClipPath(
                clipper: Curve(),
                child: Image.network(
                data[index]['image'],
                height: 350,width: 350,
               ),
              ),
              Positioned(
                top: 290,left: 145,
                child: Container(

                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () => trailer(data, index),
                  tooltip: 'Play Trailer',
                  iconSize: 30
                  ,),
                  
        
        height: 60,width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,                                
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(data[index]['name'],
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                textStyle: TextStyle(
                color: Colors.indigo[900],fontWeight: FontWeight.bold,
                fontSize: 20)) ),
                  
                
          SizedBox( height: 10, ),
          
          Text(data[index]['genre'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal)),
            SizedBox(height: 20,),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Year',style: TextStyle(fontSize: 13)),    
                    Text("Ratings" ,style: TextStyle(fontSize: 13)),                        
                    Text("Duration" , style: TextStyle(fontSize: 13)),                      
                  ]),
                  SizedBox(height: 2,),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    data[index]['yearOfRelease'].toString(),
                    style: GoogleFonts.archivo(textStyle: 
                    TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
                Text(data[index]['rating'],
                    style: GoogleFonts.archivo(textStyle: 
                    TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
                Text(data[index]['duration'],
                    style: GoogleFonts.archivo(textStyle: 
                    TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
              ]),  
            ],
          ),

          
          SizedBox(height: 20,),
          Text(data[index]['description'],textAlign: TextAlign.center,
              style: GoogleFonts.pTSans( textStyle:
              TextStyle( fontSize: 17)),),
              SizedBox(height: 20,),

          Text("Memorable Scene",
              textAlign: TextAlign.center,
              style:TextStyle(fontSize: 16 ,),),
          Text(data[index]['memorableScene'],
              textAlign: TextAlign.center,
              style: GoogleFonts.archivo(textStyle:
              TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,wordSpacing: 3))),
          SizedBox(height: 20,),

         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[

           Row(
             children: <Widget>[
               Text("Director : " ,
                  style: GoogleFonts.archivo(textStyle:
              TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  Text(data[index]['director'],
                  style: TextStyle(fontSize: 18)),
             ],
           ),
            SizedBox(height: 10,),
  
          Row(
            children: <Widget>[
              Text("Producer : " ,
                  style: GoogleFonts.archivo(textStyle:
              TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  Text( data[index]['producer'],
                  style: TextStyle(fontSize: 18)),
            ],
          ),
              SizedBox(height: 10,),

          Row(
            children: <Widget>[
              Text("Writers : " ,
                  style: GoogleFonts.archivo(textStyle:
              TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  Text(data[index]['writer'],
                  style: TextStyle(fontSize: 20)),
            ],
          ),
         ],) ,
          SizedBox(
            height: 20,
          ),

          Row(  
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Budget :", 
                    style: GoogleFonts.archivo(textStyle: 
                    TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                    SizedBox(width: 5,),
                Text(data[index]['budget'],
                    style: TextStyle(fontSize: 16))
              ],
            ),
            SizedBox(width: 30,),
            Row(
              children: <Widget>[
                Text("Gross Income :" ,
                    style:GoogleFonts.archivo(textStyle: 
                    TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                    SizedBox(width: 5,),
                Text( data[index]['gross'],
                    style:TextStyle(fontSize: 16) ),
              ],
            ),         
          ],
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class Curve extends CustomClipper<Path>{

@override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstend = Offset(0.0,size.height);
    var firstcontrol = Offset(size.width/2,size.height - 65);
    path.quadraticBezierTo(firstcontrol.dx,firstcontrol.dy,firstend.dx, firstend.dy);

    var secondcontrol = Offset(size.width/2 +5,size.height - 65);
    var secondend = Offset(size.width,size.height);
    path.quadraticBezierTo(secondcontrol.dx, secondcontrol.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
Future trailer(data, index) async
{

  String url = data[index]['url'];
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw'Could not launch $url';
  }
}

