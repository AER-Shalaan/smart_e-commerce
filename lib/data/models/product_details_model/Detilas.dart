class Detilas {
  Detilas({
      this.itemID, 
      this.ram, 
      this.memory, 
      this.cpu, 
      this.color, 
      this.screenSize,});

  Detilas.fromJson(dynamic json) {
    itemID = json['Item_ID'];
    ram = json['RAM'];
    memory = json['Memory'];
    cpu = json['CPU'];
    color = json['Color'];
    screenSize = json['Screen_Size'];
  }
  String? itemID;
  String? ram;
  String? memory;
  String? cpu;
  String? color;
  String? screenSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = itemID;
    map['RAM'] = ram;
    map['Memory'] = memory;
    map['CPU'] = cpu;
    map['Color'] = color;
    map['Screen_Size'] = screenSize;
    return map;
  }

}