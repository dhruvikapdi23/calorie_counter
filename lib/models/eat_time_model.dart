class EatTimeModel {
  String? title;
  String? time;
  String? desc;

  EatTimeModel({this.title, this.time, this.desc});

  EatTimeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['time'] = time;
    data['desc'] = desc;
    return data;
  }
}
