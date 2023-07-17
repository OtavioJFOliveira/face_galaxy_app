

import 'package:face_galaxy_app/pages/faceControl.dart';
import 'package:face_galaxy_app/pages/face_detector_view.dart';
import 'package:face_galaxy_app/pages/face_mesh_detector_view.dart';
import 'package:flutter/material.dart';
import 'package:face_galaxy_app/main.dart';
import 'package:face_galaxy_app/services/ssh.dart';
import 'package:face_galaxy_app/services/variables.dart';

class lgConnection extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _lgConnectionPageState();
  }
  //_lgConnectionPageState  createState() => _lgConnectionPageState();

}


class _lgConnectionPageState extends State<lgConnection> with TickerProviderStateMixin {
  final _LGIP = TextEditingController();
  final _USARNAME= TextEditingController();
  final _PASSWORD = TextEditingController();
  final _SSHPORT = TextEditingController();
  late TabController _tabController;
  bool _showPassword = true;
  bool _connected = false;
  final _formInfoKey = GlobalKey<FormState>();
  String btnText = "Save";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _LGIP.dispose();
    _USARNAME.dispose();
    _PASSWORD.dispose();
    _SSHPORT.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[
                        Colors.white10,
                        Colors.white
                      ]
                  )
              ),
              child: Column(
                children: <Widget>[
                  Container(height:45),
                  Container(
                      width: size.width*.8,
                      child: Form(
                        key: _formInfoKey,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue,width: 3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(height:30),
                                Container(
                                  width: size.width*.7,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value){
                                      if(value!.isEmpty) return "The Master IP is mandatory";
                                      return null;
                                    },
                                    controller: _LGIP,
                                    decoration: InputDecoration(
                                      labelText: lgIP,
                                      hintText: "LG Master IP",
                                      labelStyle: TextStyle(color: Colors.black87),
                                      contentPadding: EdgeInsets.fromLTRB(30, 10,20, 10),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                                    ),
                                  ),
                                ),
                                Container(height:15),
                                Container(
                                  width: size.width*.7,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      if(value!.isEmpty) return "The Username is mandatory";
                                      return null;
                                    },
                                    controller: _USARNAME,
                                    decoration: InputDecoration(
                                      labelText: username,
                                      labelStyle: TextStyle(color: Colors.black87),
                                      contentPadding: EdgeInsets.fromLTRB(30, 10,20, 10),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                                    ),
                                  ),
                                ),
                                Container(height:15),
                                Container(
                                  width: size.width*.7,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      if(value!.isEmpty) return "The password is mandatory";
                                      return null;
                                    },
                                    obscureText: _showPassword,
                                    controller: _PASSWORD,
                                    decoration: InputDecoration(
                                        labelText: "password",
                                        labelStyle: TextStyle(color: Colors.black87),
                                        contentPadding: EdgeInsets.fromLTRB(30, 10,20, 10),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                                        suffixIcon: GestureDetector(
                                          child: Icon(_showPassword == false ? Icons.visibility :Icons.visibility_off,size: 30,),
                                          onTap: (){
                                            setState(() {
                                              _showPassword =! _showPassword;
                                            });
                                          },
                                        )
                                    ),
                                  ),
                                ),
                                Container(height:15),
                                Container(
                                  width: size.width*.7,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value){
                                      if(value!.isEmpty) return "The ssh port is mandatory";
                                      return null;
                                    },
                                    controller: _SSHPORT,
                                    decoration: InputDecoration(
                                      labelText: sshPort.toString(),
                                      labelStyle: TextStyle(color: Colors.black87),
                                      contentPadding: EdgeInsets.fromLTRB(30, 10,20, 10),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                                    ),
                                  ),
                                ),
                                Container(height:50),
                                Container(
                                  width: size.width*.6,
                                  height: 50,
                                  color: Colors.white,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue
                                    ),
                                    child: Text(btnText ,style: TextStyle(
                                        color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
                                    onPressed: (){
                                      if(_formInfoKey.currentState!.validate()){
                                        FocusScope.of(context).requestFocus(new FocusNode());
                                        lgIP = _LGIP.text;
                                        username = _USARNAME.text;
                                        password = _PASSWORD.text;
                                        sshPort = int.parse(_SSHPORT.text);
                                       // mainapp();
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FaceDetectorView()));
                                        //ssh('echo "flytoview=<LookAt><longitude>-122.485046</longitude><latitude>37.820047</latitude><heading>1</heading><range>3000</range><tilt>40</tilt></LookAt>" > /tmp/query.txt');
                                        setState(() {
                                          //btnText = "disconnect";
                                          //controlBottonSend = 'NetInfo';
                                        });
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BluetoothPage()));
                                      }

                                    },
                                  ),
                                ),
                                Container(height:30),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),

                ],
              )
          ),
        ),
      ),

    );
  }
}


