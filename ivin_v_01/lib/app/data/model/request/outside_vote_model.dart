class outsideVoteModule {
  bool? outsideVoter;

  outsideVoteModule({this.outsideVoter});

  outsideVoteModule.fromJson(Map<String, dynamic> json) {
    outsideVoter = json['outside_voter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['outside_voter'] = this.outsideVoter;
    return data;
  }
}
