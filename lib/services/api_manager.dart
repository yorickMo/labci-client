import 'dart:convert';

import 'package:ci_apiclient/models/serverlist.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  static const String region = String.fromEnvironment("AWS_REGION");

  Future<List<ServerList>> getServers() async {
    var serverModel = null;

    try {
      print("start reading");
      var response = await http.get(Uri.parse(
          "https://cloudrun-api-gssmt3brqq-ew.a.run.app/get_instances?region=" +
              region));
      if (response.statusCode == 200) {
        var jsonString = response.body;

        var jsonMap = json.decode(jsonString);
        print("response is 200");
        print(jsonMap);

        serverModel = serverListFromJson(jsonString);
      } else {
        print(response.statusCode);
      }
    } catch (Exception) {
      return serverModel;
    }

    return serverModel;
  }
}
