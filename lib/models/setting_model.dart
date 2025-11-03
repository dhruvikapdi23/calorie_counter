class SettingModel {
  String? title;
  List<SubMenuList>? subMenuList;

  SettingModel({this.title, this.subMenuList});

  SettingModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['subMenuList'] != null) {
      subMenuList = <SubMenuList>[];
      json['subMenuList'].forEach((v) {
        subMenuList!.add(SubMenuList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (subMenuList != null) {
      data['subMenuList'] = subMenuList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubMenuList {
  String? title;
  String? desc;
  String? icon;

  SubMenuList({this.title, this.desc, this.icon});

  SubMenuList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['icon'] = icon;
    return data;
  }
}
