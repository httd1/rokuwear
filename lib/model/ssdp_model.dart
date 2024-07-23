class SsdpModel {
  final String apiLocation;
  final String usn;
  final String server;
  final String deviceGroup;
  final String mac;

  SsdpModel(this.apiLocation, this.usn, this.server, this.deviceGroup, this.mac);

  factory SsdpModel.fromString(String data) {
    var patternApiLocation = RegExp(r'LOCATION:\s?([^\n]+)');
    var matchApiLocation = patternApiLocation.firstMatch(data);

    var patternUsn = RegExp(r'USN:\s?([^\n]+)');
    var matchUsn = patternUsn.firstMatch(data);

    var patternServer = RegExp(r'Server:\s?([^\n]+)');
    var matchServer = patternServer.firstMatch(data);

    var patternDeviceGroup = RegExp(r'device\-group\.roku\.com:\s?([^\n]+)');
    var matchDeviceGroup = patternDeviceGroup.firstMatch(data);

    var patternMac = RegExp(r'MAC=\s?([^;]+)');
    var matchMac = patternMac.firstMatch(data);

    if (matchApiLocation == null || matchApiLocation.group(1) == null) {
      throw Exception('Doesn\'t exists LOCATION key!');
    }

    if (matchUsn == null || matchUsn.group(1) == null) {
      throw Exception('Doesn\'t exists USN key!');
    }

    if (matchServer == null || matchServer.group(1) == null) {
      throw Exception('Doesn\'t exists Server key!');
    }

    if (matchDeviceGroup == null || matchDeviceGroup.group(1) == null) {
      throw Exception('Doesn\'t exists device-group.roku.com key!');
    }

    if (matchMac == null || matchMac.group(1) == null) {
      throw Exception('Doesn\'t exists MAC key!');
    }

    String apiLocation = matchApiLocation.group(1)!.trim();
    String usn = matchUsn.group(1)!.trim();
    String server = matchServer.group(1)!.trim();
    String deviceGroup = matchServer.group(1)!.trim();
    String mac = matchServer.group(1)!.trim();

    return SsdpModel(apiLocation, usn, server, deviceGroup, mac);
  }

  Map<String, dynamic> toMap() {
    return {
      'apiLocation': apiLocation,
      'usn': usn,
      'server': server,
      'deviceGroup': deviceGroup,
      'mac': mac,
    };
  }
}
