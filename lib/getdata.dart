import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userapidata/modelclass.dart';
class Getdata extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetdateState();
  }

}
class _GetdateState extends State<Getdata>{
  String name = "";
  String DOB = '';
  String gender = "";
  String Email = "";
  String picture = "";
  String username = "";
  Datatest a = Datatest();
  bool apidataload = true;
  @override
  void initState() {
    // TODO: implement initState
    fetchdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            centerTitle: true,
            title: Text('Random data',
            style: TextStyle(
             color: Colors.black
            ),),
          ),
          body: Center(
            child: apidataload?CircularProgressIndicator():Container(
              height: MediaQuery.of(context).size.height*0.8,
              width:  MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(a.results[0].picture!.large),
                  ),
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(top: 10),
                         alignment: Alignment.center,
                         child: Text("Name",style: TextStyle(
                             fontSize: 20
                         ),),
                       ),
                     ),
                     Expanded(
                       flex: 2,
                       child: Container(
                         margin: EdgeInsets.only(top: 10,right: 20),
                         padding: EdgeInsets.only(left: 10),
                         height:  MediaQuery.of(context).size.height*0.06,
                         width:  MediaQuery.of(context).size.height*0.25,
                         alignment: Alignment.centerLeft,
                         child: Text("${a.results[0].name!.title} ${a.results[0].name!.first} ${a.results[0].name!.last}",style: TextStyle(
                             fontSize: 17
                         ),),
                         decoration: BoxDecoration(
                           border: Border.all(
                             color: Colors.black,
                             width: 1
                           )
                         ),
                       ),
                     ),
                   ],
                 ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text("Username",style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(top: 10,right: 20),
                          padding: EdgeInsets.only(left: 10),
                          height:  MediaQuery.of(context).size.height*0.06,
                          width:  MediaQuery.of(context).size.height*0.25,
                          alignment: Alignment.centerLeft,
                          child: Text(a.results[0].login!.username,style: TextStyle(
                              fontSize: 17
                          ),),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text("Gender",style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(top: 10,right: 20),
                          padding: EdgeInsets.only(left: 10),
                          height:  MediaQuery.of(context).size.height*0.06,
                          width:  MediaQuery.of(context).size.height*0.25,
                          alignment: Alignment.centerLeft,
                          child: Text(a.results[0].gender,style: TextStyle(
                              fontSize: 17
                          ),),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text("Mobile",style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(top: 10,right: 20),
                          padding: EdgeInsets.only(left: 10),
                          height:  MediaQuery.of(context).size.height*0.06,
                          width:  MediaQuery.of(context).size.height*0.25,
                          alignment: Alignment.centerLeft,
                          child: Text(a.results[0].phone,style: TextStyle(
                              fontSize: 18
                          ),),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text("Email",style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(top: 10,right: 20),
                          padding: EdgeInsets.only(left: 10),
                          height:  MediaQuery.of(context).size.height*0.06,
                          width:  MediaQuery.of(context).size.height*0.25,
                          alignment: Alignment.centerLeft,
                          child: Text(a.results[0].email,style: TextStyle(
                              fontSize: 17
                          ),),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      fetchdata();
                    },
                    child: Text("Refresh"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  Future<Datatest> fetchdata() async{
    final response = await http.get(Uri(host: "randomuser.me",scheme: "https",path: "api"));
    final Map<String, dynamic> data = jsonDecode(response.body);
    a = Datatest.fromjson(data);
    print(data);
    print(a.results[0].name!.first);
    setState(() {
      apidataload = false;
    });
    return a;
  }

}
