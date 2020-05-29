class OtpSend{
  String userId;

  OtpSend({this.userId});

  factory OtpSend.fromJson(Map<String,dynamic> json){
    return OtpSend(
      userId:json['userId'],

    );
  }

  Map toMap(){
    var map =  new Map<String,dynamic>();
    map['userId']=userId;
   
    return map;
  }

  Map<String,dynamic> tojson() {
    return{
      "userId":userId,
     
    };
  }
}