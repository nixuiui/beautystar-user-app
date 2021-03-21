import 'dart:convert';

Version versionFromJson(String str) => Version.fromJson(json.decode(str));

String versionToJson(Version data) => json.encode(data.toJson());

class Version {
    Version({
        this.androidVersion,
        this.androidVersionCode,
        this.iOsVersion,
        this.iOsVersionCode,
        this.androidMinimumVersion,
        this.iOsMinimumVersion,
        this.playstore,
        this.appstore,
    });

    String androidVersion;
    int androidVersionCode;
    String iOsVersion;
    int iOsVersionCode;
    int androidMinimumVersion;
    int iOsMinimumVersion;
    String playstore;
    String appstore;

    factory Version.fromJson(Map<String, dynamic> json) => Version(
        androidVersion: json["androidVersion"],
        androidVersionCode: json["androidVersionCode"],
        iOsVersion: json["iOSVersion"],
        iOsVersionCode: json["iOSVersionCode"],
        androidMinimumVersion: json["androidMinimumVersion"],
        iOsMinimumVersion: json["iOSMinimumVersion"],
        playstore: json["playstore"],
        appstore: json["appstore"],
    );

    Map<String, dynamic> toJson() => {
        "androidVersion": androidVersion,
        "androidVersionCode": androidVersionCode,
        "iOSVersion": iOsVersion,
        "iOSVersionCode": iOsVersionCode,
        "androidMinimumVersion": androidMinimumVersion,
        "iOSMinimumVersion": iOsMinimumVersion,
        "playstore": playstore,
        "appstore": appstore,
    };
}