import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kgp2_ss_demo/splash_screen.dart';
import 'package:profanity_filter/profanity_filter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profanity Filter',
      home: SplashScreen(title: 'Profanity Filter',),
    );
  }
}

class ProfanityFilterDemo extends StatefulWidget {
  @override
  _ProfanityFilterDemoState createState() => _ProfanityFilterDemoState();
}

class _ProfanityFilterDemoState extends State<ProfanityFilterDemo> {
  final TextEditingController _textController = TextEditingController();
  final ProfanityFilter _profanityFilter = ProfanityFilter();

  bool _hasProfanity = false;

  void _checkProfanity(String text) {
    setState(() {
      _hasProfanity = _profanityFilter.hasProfanity(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profanity Filter'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),

    child:Center(

      child: TextField(
        controller: _textController,
        onChanged: _checkProfanity,
        decoration: InputDecoration(
          labelText: 'Enter text',
          border: OutlineInputBorder(),
          hintText: 'Enter text here',
          errorText: _hasProfanity ? 'No profanity allowed!' : null,
        ),

      ),

        ),


      ),
      drawer: Drawer(

        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [ Theme
                      .of(context)
                      .primaryColor, Theme
                      .of(context)
                      .accentColor,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text("Profanity Filter",
                  style: TextStyle(fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.screen_lock_landscape_rounded,
                color: Theme
                    .of(context)
                    .accentColor,),
              title: Text(
                'Splash Screen', style: TextStyle(fontSize: 17, color: Theme
                  .of(context)
                  .accentColor),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        SplashScreen(title: "Splash Screen")));
              },
            ),
            Divider(color: Theme
                .of(context)
                .primaryColor, height: 1,),
            ListTile(

              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
