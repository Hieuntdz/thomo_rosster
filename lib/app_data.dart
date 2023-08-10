class Appdata {
/*
{
  "id": 3,
  "maintain": "dasdsa",
  "url": "djskadkas",
  "invite_code": "dasdas"
}
*/

  String? maintain;
  String? url;
  String? inviteCode;
  String? appId;

  Appdata({this.maintain, this.url, this.inviteCode, this.appId});

  Appdata.fromJson(Map<String, dynamic> json) {
    maintain = json['maintain']?.toString();
    url = json['url']?.toString();
    inviteCode = json['invite_code']?.toString();
    appId = json['app_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['maintain'] = maintain;
    data['url'] = url;
    data['invite_code'] = inviteCode;
    return data;
  }
}
