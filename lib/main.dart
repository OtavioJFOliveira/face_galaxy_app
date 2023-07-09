import 'dart:async';

import 'package:face_galaxy_app/pages/lgConnection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Galaxy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Face App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Text("Face Galaxy"),
          backgroundColor: Colors.blue,
          leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,size: 35,),
             // onPressed:
              onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>lgConnection()));
              //  setState(() {
                //});
              }
              ),

        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        //title:Text(widget.title)
      ),
      body: Center(

        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container( height: size.height*.45,
              ),

              Row(
                children: <Widget>[
                  //Container(width: size.width*.05,),
                  Container(color: Colors.white,
                      height: size.height*.25,
                      width: size.width,
                      child: Image.asset("images/mascot.png")
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(width: size.width*.05,),
                  Container(
                    height: size.height*.2,
                    width: size.width*.4,
                    child: Image.asset(
                      "images/lgLab.png",
                    ),
                  ),
                  Container(width: size.width*.1,),
                  Container(
                    height: size.height*.2,
                    width: size.width*.4,
                    child: Image.asset(
                      "images/lg_logo.png",
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
