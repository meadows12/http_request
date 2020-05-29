import 'dart:convert';

import 'package:flutter/scheduler.dart';

class User{
  final String emailId;
  final String mobile;
  final String firstName;
  final String lastName;
  final String password;
  final String department;
  final String univ_name;
  final String college_name;
  final String university_year;
  final String build_no;
  final String android_no;
  //DateTime createdAt;

  

  User({this.college_name,this.department,this.emailId,this.firstName,this.lastName,this.mobile
          ,this.password,this.univ_name,this.university_year,this.android_no,this.build_no});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      
      emailId: json['email_id'],
      mobile: json['mobile_no'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      password: json['user_password'],
      department: json['department'],
      univ_name: json['university_name'],
      university_year: json['univ_year_sem_id'],
      college_name: json['college_name'],
      build_no: json['build_no'],
      android_no: json['android_id'],
      //createdAt: DateTime.parse(json["created_datetime"]),
      
    );
  }

  Map toMap() {
    var map =  new Map<String,dynamic>();
      map["email_id"] =  emailId;
      map['mobile_no']= mobile.toString();
      map['first_name'] = firstName;
      map['last_name'] =  lastName;
      map['user_password'] = password;
      map['department']= department;
      map['university_name'] = univ_name;
      map['college_name'] = college_name;
      map['univ_year_sem_id'] = university_year;
      map['build_no'] = build_no;
      map['android_id'] = android_no;
     // map["created_datetime"] = createdAt;
      return map;
  }

  Map<String,dynamic> tojson() {
    return{
      "email_id": emailId,
      "mobile_no":mobile,
      "first_name": firstName,
      "last_name":lastName,
      "user_password": password,
      "department":department,
      "university_name":univ_name,
      "college_name":college_name,
      "univ_year_sem_id":university_year,
      "build_no":build_no,
      "android_id":android_no,
      //"created_datetime": createdAt.toIso8601String(),
    };
  }

}