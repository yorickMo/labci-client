// To parse this JSON data, do
//
//     final serverList = serverListFromJson(jsonString);

import 'dart:convert';

List<ServerList> serverListFromJson(String str) =>
    List<ServerList>.from(json.decode(str).map((x) => ServerList.fromJson(x)));

String serverListToJson(List<ServerList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServerList {
  ServerList({
    this.state,
    this.tags,
    this.type,
  });

  int state;
  Tags tags;
  String type;

  factory ServerList.fromJson(Map<String, dynamic> json) => ServerList(
        state: json["state"] == null ? null : json["state"],
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "state": state == null ? null : state,
        "tags": tags == null ? null : tags.toJson(),
        "type": type == null ? null : type,
      };
}

class Tags {
  Tags({
    this.name,
    this.instanceid,
    this.service,
    this.student,
    this.awsAutoscalingGroupName,
    this.awsEc2LaunchtemplateId,
    this.awsEc2LaunchtemplateVersion,
  });

  String name;
  String instanceid;

  String service;
  String student;
  String awsAutoscalingGroupName;
  String awsEc2LaunchtemplateId;
  String awsEc2LaunchtemplateVersion;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        name: json["Name"] == null ? null : json["Name"],
        instanceid: json["instanceid"] == null ? null : json["instanceid"],
        service: json["service"] == null ? null : json["service"],
        student: json["student"] == null ? null : json["student"],
        awsAutoscalingGroupName: json["aws:autoscaling:groupName"] == null
            ? null
            : json["aws:autoscaling:groupName"],
        awsEc2LaunchtemplateId: json["aws:ec2launchtemplate:id"] == null
            ? null
            : json["aws:ec2launchtemplate:id"],
        awsEc2LaunchtemplateVersion:
            json["aws:ec2launchtemplate:version"] == null
                ? null
                : json["aws:ec2launchtemplate:version"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "instanceid": instanceid == null ? null : instanceid,
        "service": service == null ? null : service,
        "student": student == null ? null : student,
        "aws:autoscaling:groupName":
            awsAutoscalingGroupName == null ? null : awsAutoscalingGroupName,
        "aws:ec2launchtemplate:id":
            awsEc2LaunchtemplateId == null ? null : awsEc2LaunchtemplateId,
        "aws:ec2launchtemplate:version": awsEc2LaunchtemplateVersion == null
            ? null
            : awsEc2LaunchtemplateVersion,
      };
}
