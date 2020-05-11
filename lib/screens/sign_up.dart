import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_request/utils/user.dart';

Future<User> createUser (String url, User user) async{

    return http.post(url,headers: 
          {'Content-Type':'application/json'},
          body:json.encode(user.tojson())).then((http.Response response){
      if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return User.fromJson(json.decode(response.body));
    });
          
    
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final String create_url = "http://www.hiddenmasterminds.com/web/index.php?r=featured/createinitialstudent";
  bool isChecked = false;

  Future<User> user;
  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFF4b0081);
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30.0),
            child: (user == null)?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 17.0,),
                    RaisedButton(
                      color: Colors.white,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: bgColor, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        User newUser  = new User(college_name: "abc",firstName: "mrunal",lastName:"joshi",password:"12abc",
                                                  emailId: "mrun12@gmail.com",department: "abc",univ_name: "sppu",university_year: "123",mobile: "0098765432",android_no: "123",build_no: "123"  );
                        User p = await createUser(create_url,newUser);

                        print(p.college_name);
                      
                        
                      },
                      splashColor: Colors.grey,
                    ),
                    FlatButton(
                      color: bgColor,
                      child: Text(
                        'Already have Account?Login here',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      onPressed: () async {
                        
                      },

                    ),
                  ],
                )
                :FutureBuilder<User>(
                  future: user,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return Text(snapshot.data.college_name);
                    }else if(snapshot.error){
                        return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                )
          ),
        ],
      ),
    );
  }
}