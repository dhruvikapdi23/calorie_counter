class ActivityLevelModel {
  String? title;
  String? icon;
  String? desc;

  ActivityLevelModel({this.title, this.icon, this.desc});

  ActivityLevelModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    data['desc'] = desc;
    return data;
  }
}
