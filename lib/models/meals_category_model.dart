class MealCategoryModel {
  String? name;
  String? icon;

  MealCategoryModel({this.name, this.icon});

  MealCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}

