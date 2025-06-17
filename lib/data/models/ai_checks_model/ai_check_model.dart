class AICheckModel {
  AICheckModel({
      this.isClean, 
      this.message,});

  AICheckModel.fromJson(dynamic json) {
    isClean = json['is_clean'];
    message = json['message'];
  }
  bool? isClean;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_clean'] = isClean;
    map['message'] = message;
    return map;
  }

}