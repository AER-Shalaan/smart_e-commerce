import 'UserProfile.dart';
import 'Adresses.dart';
import 'AdvNumbers.dart';

class ProfileModel {
  ProfileModel({
      this.userProfile, 
      this.adresses, 
      this.advNumbers,});

  ProfileModel.fromJson(dynamic json) {
    userProfile = json['UserProfile'] != null ? UserProfile.fromJson(json['UserProfile']) : null;
    adresses = json['Adresses'] != null ? Adresses.fromJson(json['Adresses']) : null;
    advNumbers = json['advNumbers'] != null ? AdvNumbers.fromJson(json['advNumbers']) : null;
  }
  UserProfile? userProfile;
  Adresses? adresses;
  AdvNumbers? advNumbers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userProfile != null) {
      map['UserProfile'] = userProfile?.toJson();
    }
    if (adresses != null) {
      map['Adresses'] = adresses?.toJson();
    }
    if (advNumbers != null) {
      map['advNumbers'] = advNumbers?.toJson();
    }
    return map;
  }

}