class Detilas {
  Detilas({
      this.itemID, 
      this.ram, 
      this.memory, 
      this.memoryType, 
      this.graphicsCard, 
      this.cpu, 
      this.weight, 
      this.screenSize, 
      this.model,});

  Detilas.fromJson(dynamic json) {
    itemID = json['Item_ID'];
    ram = json['RAM'];
    memory = json['Memory'];
    memoryType = json['Memory_Type'];
    graphicsCard = json['Graphics_Card'];
    cpu = json['CPU'];
    weight = json['Weight'];
    screenSize = json['Screen_Size'];
    model = json['Model'];
  }
  String? itemID;
  String? ram;
  String? memory;
  String? memoryType;
  String? graphicsCard;
  String? cpu;
  String? weight;
  String? screenSize;
  String? model;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = itemID;
    map['RAM'] = ram;
    map['Memory'] = memory;
    map['Memory_Type'] = memoryType;
    map['Graphics_Card'] = graphicsCard;
    map['CPU'] = cpu;
    map['Weight'] = weight;
    map['Screen_Size'] = screenSize;
    map['Model'] = model;
    return map;
  }

}