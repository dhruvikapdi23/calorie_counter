class ExerciseModel {
  String? image;
  String? name;
  String? time;
  String? kcal;

  ExerciseModel({this.image, this.name, this.time, this.kcal});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    time = json['time'];
    kcal = json['kcal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['time'] = time;
    data['kcal'] = kcal;
    return data;
  }
}
