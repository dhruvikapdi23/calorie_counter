class UserInfoTitleModel {
  String? title;
  String? desc;

  UserInfoTitleModel({this.title, this.desc});

  UserInfoTitleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }
}
