class DashboardBottomModel {
  String? title;
  String? icon;
  String? selectedIcon;

  DashboardBottomModel({this.title, this.icon, this.selectedIcon});

  DashboardBottomModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    selectedIcon = json['selectedIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    data['selectedIcon'] = selectedIcon;
    return data;
  }
}
