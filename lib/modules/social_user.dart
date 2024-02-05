class SocialUserModel{
  String name;
  String email;
  String phone;
  String uId;
  bool isEmailVerified;
  SocialUserModel({
   required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVerified
  });

  factory SocialUserModel.formJson(Map<String,dynamic>? json){
    return SocialUserModel(
        name: json?['name'],
        email: json?['email'],
        phone: json?['phone'],
        uId: json?['uid'],
      isEmailVerified: json?['isEmailVerified']
    );
  }

  Map<String,dynamic> toMap(){
  return {
    'name' : name,
    'email' : email,
    'phone' : phone,
    'uId' : uId,
    'isEmailVerified': isEmailVerified,
  };
  }



}