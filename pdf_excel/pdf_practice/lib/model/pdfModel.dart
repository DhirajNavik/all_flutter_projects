import 'dart:convert';

PollingStationPdfDownloadModel pollingStationPdfDownloadModelFromJson(
        String str) =>
    PollingStationPdfDownloadModel.fromJson(json.decode(str));
String pollingStationPdfDownloadModelToJson(
        PollingStationPdfDownloadModel data) =>
    json.encode(data.toJson());

class PollingStationPdfDownloadModel {
  PollingStationPdfDownloadModel({
    this.voterSerialNumber,
    this.voterId,
    this.partyInclination,
    this.name,
    this.outsideVoter,
    this.contactNumber,
  });

  PollingStationPdfDownloadModel.fromJson(dynamic json) {
    voterSerialNumber = json['Voter_SerialNumber'];
    voterId = json['VoterId'];
    partyInclination = json['PartyInclination'] != null
        ? PartyInclination.fromJson(json['PartyInclination'])
        : null;
    name = json['Name'];
    outsideVoter = json['outside_voter'];
    contactNumber = json['ContactNumber'];
  }
  String? voterSerialNumber;
  String? voterId;
  PartyInclination? partyInclination;
  String? name;
  bool? outsideVoter;
  dynamic contactNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Voter_SerialNumber'] = voterSerialNumber;
    map['VoterId'] = voterId;
    if (partyInclination != null) {
      map['PartyInclination'] = partyInclination?.toJson();
    }
    map['Name'] = name;
    map['outside_voter'] = outsideVoter;
    map['ContactNumber'] = contactNumber;
    return map;
  }
}

PartyInclination partyInclinationFromJson(String str) =>
    PartyInclination.fromJson(json.decode(str));
String partyInclinationToJson(PartyInclination data) =>
    json.encode(data.toJson());

class PartyInclination {
  PartyInclination({
    this.partyName,
  });

  PartyInclination.fromJson(dynamic json) {
    partyName = json['PartyName'];
  }
  String? partyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PartyName'] = partyName;
    return map;
  }
}
