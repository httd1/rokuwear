import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';

class DeviceModel {
  final String friendlyName;
  final String manuFacturer;
  final String serialNumber;
  final String icon;

  DeviceModel(
    this.friendlyName,
    this.manuFacturer,
    this.serialNumber,
    this.icon,
  );

  factory DeviceModel.fromXml(String xml) {
    var parser = XmlDocument.parse(xml);

    String friendlyName = parser.xpath('/root/device/friendlyName').first.innerText;
    String manuFacturer = parser.xpath('/root/device/manufacturer').first.innerText;
    String serialNumber = parser.xpath('/root/device/serialNumber').first.innerText;
    String icon = parser.xpath('/root/device/iconList/icon/url').first.innerText;

    return DeviceModel(friendlyName, manuFacturer, serialNumber, icon);
  }
}
