import 'package:flutter/material.dart';
import 'package:face_galaxy_app/main.dart';

class lgConnection extends StatefulWidget {
  static final tag = 'netinfo-page';
 // lgConnection ({Key key}):super(key:key);
  @override
  _lgConnectionPageState  createState() => _lgConnectionPageState();
}

String lgIP = "";
String username = "";
String password ="";
String sshPort ="";

class _lgConnectionPageState extends State<lgConnection> {
  final _LGIP = TextEditingController();
  final _USARNAME= TextEditingController();
  final _PASSWORD = TextEditingController();
  final _SSHPORT = TextEditingController();
  bool _showPassword = true;
  final _formInfoKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
                    //height: 100,
                      width: size.width*.8,
                      //color: Colors.green,
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
                                      labelText: "LG Master IP",
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
                                      labelText: "Username",
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
                                        labelText: "Password",
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
                                      labelText: "SSH Port",
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
                                    child: Text("Connect", style: TextStyle(
                                        color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                                    onPressed: (){
                                      if(_formInfoKey.currentState!.validate()){
                                        FocusScope.of(context).requestFocus(new FocusNode());
                                        lgIP = _LGIP.text;
                                        username = _USARNAME.text;
                                        password = _PASSWORD.text;
                                        sshPort = _SSHPORT.text;
                                        setState(() {
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
