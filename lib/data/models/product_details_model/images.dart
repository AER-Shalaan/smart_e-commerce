class Images {
  List<String>? itemImages;

  Images({this.itemImages});

  Images.fromJson(Map<String, dynamic> json) {
    itemImages = json.values.map((e) => e.toString()).toList();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    for (int i = 0; i < (itemImages?.length ?? 0); i++) {
      map['Item_Images-${i + 1}'] = itemImages![i];
    }
    return map;
  }
}
