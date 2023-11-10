// To parse this JSON data, do
//
//     final appModel = appModelFromJson(jsonString);

import 'dart:convert';

AppModel appModelFromJson(String str) => AppModel.fromJson(json.decode(str));

String appModelToJson(AppModel data) => json.encode(data.toJson());

class AppModel {
  final int? appTab;
  final int? homeFilter;

  AppModel({
    this.appTab,
    this.homeFilter,
  });

  AppModel copyWith({
    int? appTab,
    int? homeFilter,
  }) =>
      AppModel(
        appTab: appTab ?? this.appTab,
        homeFilter: homeFilter ?? this.homeFilter,
      );

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        appTab: json["AppTab"],
        homeFilter: json["Home_filter"],
      );

  Map<String, dynamic> toJson() => {
        "AppTab": appTab,
        "Home_filter": homeFilter,
      };
}

// {
//   "AppTab":0,
//   "Home_filter":0
// }
