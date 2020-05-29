class OtpVerification{

  final String userId;
  final String otp;

  OtpVerification({this.otp,this.userId});

  factory OtpVerification.fromJson(Map<String,dynamic> json){
    return OtpVerification(
      userId:json['userId'],
      otp:json['mobileOtp']

    );
  }

  Map toMap(){
    var map =  new Map<String,dynamic>();
    map['userId']=userId;
    map['mobileOtp']=otp;
    return map;
  }

  Map<String,dynamic> tojson() {
    return{
      "userId":userId,
      "mobileOtp":otp
    };
  }
}