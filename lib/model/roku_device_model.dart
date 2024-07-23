import 'package:rokuwear/model/device_model.dart';
import 'package:rokuwear/model/ssdp_model.dart';

class RokuDeviceModel {
  final SsdpModel ssdp;
  final DeviceModel device;

  RokuDeviceModel(this.ssdp, this.device);
}
