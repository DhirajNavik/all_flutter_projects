class PollingStationModule {
  String? message;
  List<Result>? result;
  bool? hasError;
  int? status;

  PollingStationModule({this.message, this.result, this.hasError, this.status});

  PollingStationModule.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    if (json['Result'] != null) {
      result = <Result>[];
      json['Result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    hasError = json['HasError'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['HasError'] = this.hasError;
    data['Status'] = this.status;
    return data;
  }
}

class Result {
  String? pollingStationNameNum;

  Result({this.pollingStationNameNum});

  Result.fromJson(Map<String, dynamic> json) {
    pollingStationNameNum = json['Polling_Station_Name_Num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Polling_Station_Name_Num'] = this.pollingStationNameNum;
    return data;
  }
}
