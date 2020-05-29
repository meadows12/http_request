import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_request/utils/otp_send.dart';
import 'package:post_request/utils/otp_verification.dart';
import 'package:post_request/utils/user.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   String userId;

  Future<User> createUser (String url,{Map body}) async{

    return http.post(url,
          body:body).then((http.Response response){
      if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    //JsonDecoder().convert(response.body);
    print(json.decode(response.body));
   
    var extractdata = json.decode(response.body);
    userId = extractdata["uid"].toString();
    print(userId);
    return User.fromJson(json.decode(response.body));
    });
          
  }

  Future<OtpSend> otpSend(String url) async{

    return http.post(url,
          body:userId).then((http.Response response){
      if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    //JsonDecoder().convert(response.body);
    print(json.decode(response.body));
   
    // var extractdata = json.decode(response.body);
    // userId = extractdata["uid"];
    // print(userId);
    //return OtpSend.fromJson(json.decode(response.body));
    });
          
  }

    


  
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final String create_url = "http://www.hiddenmasterminds.com/web/index.php?r=student/createstudent";
  final String otp_verification = "http://www.hiddenmasterminds.com/web/index.php?r=jguest/verifystudent";
  static final otpSend_url = "http://www.hiddenmasterminds.com/web/index.php?r=student/reverifyotp";
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
                                                  emailId: "mr221@gmail.com",department: "abc",univ_name: "sppu",university_year: "123",mobile:"9413832230",android_no: "123",build_no: "123"  );
                        User p = await createUser(create_url,body:newUser.toMap());
                        //OtpSend o = OtpSend(userId: userId);
                        await otpSend(otpSend_url);
                        // String otp = "6890";
                        // OtpVerification newOtp = new OtpVerification(otp:otp,userId: "6417");
                        // OtpVerification s = await verifyotp(otp_verification,body:newOtp.toMap());

                      
                        
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