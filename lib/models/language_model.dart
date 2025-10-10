import 'dart:ui';

class LanguageModel {
  String? icon;
  String? title;
  Locale? locale;
  String? code;

  LanguageModel({this.icon, this.title, this.locale, this.code});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    locale = json['locale'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['locale'] = locale;
    data['code'] = code;
    return data;
  }
}
