class MealItemModel {
  String? title;
  List<MealsModel>? meals;

  MealItemModel({this.title, this.meals});

  MealItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['meals'] != null) {
      meals = <MealsModel>[];
      json['meals'].forEach((v) {
        meals!.add(new MealsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealsModel {
  String? image;
  String? title;
  int? kcal;
  int? carbs;
  int? fat;
  int? protein;
  bool? isFavourite;

  MealsModel(
      {this.image,
        this.title,
        this.kcal,
        this.carbs,
        this.fat,
        this.protein,
        this.isFavourite});

  MealsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    kcal = json['kcal'];
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['kcal'] = kcal;
    data['carbs'] = carbs;
    data['fat'] = fat;
    data['protein'] = protein;
    data['isFavourite'] = isFavourite;
    return data;
  }
}
