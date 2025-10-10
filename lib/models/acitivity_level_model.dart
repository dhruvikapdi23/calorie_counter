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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['desc'] = this.desc;
    return data;
  }
}
