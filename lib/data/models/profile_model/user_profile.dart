class UserProfile {
  UserProfile({
      this.buyerID, 
      this.buyerImage, 
      this.buyerName, 
      this.email, 
      this.phone,});

  UserProfile.fromJson(dynamic json) {
    buyerID = json['Buyer_ID'];
    buyerImage = json['Buyer_Image'];
    buyerName = json['Buyer_Name'];
    email = json['Email'];
    phone = json['phone'];
  }
  num? buyerID;
  String? buyerImage;
  String? buyerName;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Buyer_ID'] = buyerID;
    map['Buyer_Image'] = buyerImage;
    map['Buyer_Name'] = buyerName;
    map['Email'] = email;
    map['phone'] = phone;
    return map;
  }

}