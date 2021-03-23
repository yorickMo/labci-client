import 'package:ci_apiclient/models/serverlist.dart';
import 'package:ci_apiclient/services/api_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ServerList>> _serverlist;
  static const String urlBase = String.fromEnvironment("IMAGE_URL");

  @override
  void initState() {
    print("urlbase=" + urlBase);
    _serverlist = API_Manager().getServers();
    print(_serverlist.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ikdoeict AWS Resources"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(urlBase),
            fit: BoxFit.cover,
          )),
          child: FutureBuilder<List<ServerList>>(
              future: _serverlist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var lengte = snapshot.data.length;

                  return ListView.builder(
                      itemCount: lengte,
                      itemBuilder: (context, index) {
                        var item = snapshot.data;
                        var title;

                        //0 : pending  16 : running 32 : shutting-down 48 : terminated 64 : stopping 80 : stopped

                        Color statecolor = null;
                        if (item[index].state == 80) {
                          statecolor = Colors.black;
                        }
                        if (item[index].state == 0) {
                          statecolor = Colors.yellow;
                        }
                        if (item[index].state == 16) {
                          statecolor = Colors.lightGreen;
                        }
                        if (item[index].state == 32) {
                          statecolor = Colors.grey;
                        }
                        if (item[index].tags.name != null) {
                          title = item[index].tags.name.toString();
                        } else if (item[index].tags.awsAutoscalingGroupName !=
                            null) {
                          title = item[index]
                              .tags
                              .awsAutoscalingGroupName
                              .toString();
                        } else
                          title = "unknown";

                        return Container(
                            height: 100,
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.all(3.0),
                            color: Colors.white.withOpacity(0.5),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.run_circle_rounded,
                                color: statecolor,
                                size: 50.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              Text(
                                  title +
                                      " (" +
                                      item[index].tags.student.toString() +
                                      ")",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text(item[index].type.toString()),
                            ]));
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
