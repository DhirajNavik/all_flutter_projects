import 'dart:convert';
InsideVoterModel insideVoterModelFromJson(String str) => InsideVoterModel.fromJson(json.decode(str));
String insideVoterModelToJson(InsideVoterModel data) => json.encode(data.toJson());
class InsideVoterModel {
  InsideVoterModel({
      this.voterSerialNumber, 
      this.insideVoter,});

  InsideVoterModel.fromJson(dynamic json) {
    voterSerialNumber = json['Voter_SerialNumber'];
    insideVoter = json['inside_voter'];
  }
  String? voterSerialNumber;
  bool? insideVoter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Voter_SerialNumber'] = voterSerialNumber;
    map['inside_voter'] = insideVoter;
    return map;
  }

}