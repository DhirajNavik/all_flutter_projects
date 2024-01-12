import 'dart:convert';

class PollingStationModule {
  final String? message;
  final List<Result>? result;
  final bool? hasError;
  final int? status;

  PollingStationModule({
    this.message,
    this.result,
    this.hasError,
    this.status,
  });

  factory PollingStationModule.fromJson(String str) =>
      PollingStationModule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PollingStationModule.fromMap(Map<String, dynamic> json) =>
      PollingStationModule(
        message: json["Message"],
        result: json["Result"] == null
            ? []
            : List<Result>.from(json["Result"]!.map((x) => Result.fromMap(x))),
        hasError: json["HasError"],
        status: json["Status"],
      );

  Map<String, dynamic> toMap() => {
        "Message": message,
        "Result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        "HasError": hasError,
        "Status": status,
      };
}

class Result {
  final String? pollingStationNameNum;

  Result({
    this.pollingStationNameNum,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        pollingStationNameNum: json["Polling_Station_Name_Num"],
      );

  Map<String, dynamic> toMap() => {
        "Polling_Station_Name_Num": pollingStationNameNum,
      };
}
