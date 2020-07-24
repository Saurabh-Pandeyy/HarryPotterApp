import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harry_potter_app/Characters/characters.dart';
import 'package:harry_potter_app/Location/filmlocation.dart';
import 'package:harry_potter_app/Movies/movies.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HarryPotter App',
      theme: ThemeData(primarySwatch: Colors.amber,),
      home: Homepage()));
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  VideoPlayerController _controller;
  Future _videoFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/Video/title.mp4');
    _videoFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  

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
        drawer: myDrawer(),
        body: Container(
          child: ListView(
            children: <Widget>[
             
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Movies()));
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(20, 7, 20, 5),
                    elevation: 8.0,
                    child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('lib/Images/movies.png'),
                        radius: 65.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Movies",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w100,
                              color: Colors.black)),
                    ],
                      )),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Character()));
                },
                child: Card(
                 margin: EdgeInsets.fromLTRB(20, 7, 20, 5),
                    elevation: 8.0,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('lib/Images/characters.jpg'),
                          radius: 65.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Characters",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w100,
                                color: Colors.black)),
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder:(BuildContext context) => Location() ));

                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(20, 7, 20, 5),
                    elevation: 10.0,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('lib/Images/location.png'),
                          radius: 55.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Film Location",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w100,
                                color: Colors.black)),
                      ],
                    )),
              ),
            ],
          ),
          
        ));
  }
  Widget myDrawer(){
    _controller.play();

    return Drawer(
      child: Column(
      children: <Widget>[

        FutureBuilder(
           future: _videoFuture,
           builder: (context,snapshot){
             return Container(
              height: 150,
              width: 500,
             child: VideoPlayer(_controller));
           },
         ),

        SizedBox(height: 30,),

        ListTile(
          leading: FaIcon(FontAwesomeIcons.facebook,color: Colors.black),
          title: Text('Official Facebook Page'),
          onTap: () => fb(),
        ),
        ListTile(
          leading: FaIcon(FontAwesomeIcons.instagram,color: Colors.black),
          title: Text('Official Instagram Page',),
          onTap: () => insta(),
        ),

        ListTile(
          leading: FaIcon(FontAwesomeIcons.twitter,color: Colors.black),
          title: Text('Official Twitter Page'),
          onTap: () => twitter(),
        ),

        ListTile(
          leading: FaIcon(FontAwesomeIcons.youtube,color: Colors.black,),
          title: Text('Official YouTube Channel'),
          onTap: () => yt(),
        )
      ],
        ) 
      
       
    );
  }
}

Future insta() async
{
  const url = 'https://instagram.com/harrypotterfilm?igshid=vlbk338inb7t';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw'Could not launch $url';
  }
}
Future twitter() async
{
  const url = 'https://twitter.com/HarryPotterFilm?s=20';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw'Could not launch $url';
  }
}
Future fb() async
{
  const url = 'https://www.facebook.com/harrypottermovie/';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw'Could not launch $url';
  }
}
Future yt() async
{
  const url = 'https://www.youtube.com/channel/UChPRO1CB_Hvd0TvKRU62iSQ/featured';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw'Could not launch $url';
  }
}