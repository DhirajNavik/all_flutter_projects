class URLs {
  URLs._privateConstructor();

  static const baseURL = "http://172.105.37.117:8000";

  static const login = baseURL + "/Ivin_1/LoginV1view/";

  static const pollingStations = baseURL + '/Ivin_1/GetpollingstationbyEmail/';

  static const getOutsidePollingData = baseURL + "/Ivin_1/GetOutsideVoter/";

  static const getInsidePollingData = baseURL + "/Ivin_1/GetInsideVoter/";

  static const outsideURL = '/Ivin_1/OutsideVoterUpdateVoter2024/';

  static const insideURL = '/Ivin_1/InsideVoterUpdateVoter2024/';

  static const getPollingStationCount = baseURL + "/Ivin_1/GetNoOfVoter/";

  static const deviceIdAddress = baseURL + "/Ivin_1/DeviceidUpdate/";

  static const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5NTMzMzQ0LCJpYXQiOjE3MDE3NTczNDQsImp0aSI6IjlmZDAzMTUzYmUzZTQ4MjdiMDM1NTdjNWFkNzMyYTM5IiwidXNlcl9pZCI6Mn0.8qoWaUFlKj0lciCQlAo_dFqieaIfcyDTBXQ40ssg5X4';
}
