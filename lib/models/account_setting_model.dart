class AccountSettingModel {
  String? title;
  int? value;

  List<AccountSubMenuList>? subMenuList;

  AccountSettingModel({this.title, this.subMenuList,this.value});

  AccountSettingModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];

    if (json['subMenuList'] != null) {
      subMenuList = <AccountSubMenuList>[];
      json['subMenuList'].forEach((v) {
        subMenuList!.add(new AccountSubMenuList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    if (subMenuList != null) {
      data['subMenuList'] = subMenuList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AccountSubMenuList {
  String? title;
  bool? isActive;

  AccountSubMenuList({this.title, this.isActive});

  AccountSubMenuList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isActive'] = isActive;
    return data;
  }
}
