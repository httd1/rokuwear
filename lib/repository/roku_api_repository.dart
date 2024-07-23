import 'package:http/http.dart' as http;
import 'package:rokuwear/model/device_model.dart';

class RokuApiRepository {
  final String host;

  RokuApiRepository(this.host);

  Future<DeviceModel> deviceInfo() async {
    var url = Uri.parse(host);
    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro, status diferente de 200!');
    }

    return DeviceModel.fromXml(response.body);
  }

  /// Equivalent to pressing down and releasing the remote control key identified after the slash.
  Future<bool> keyPress(String key) async {
    var url = Uri.parse("$host/keypress/$key");
    var response = await http.post(url);

    return (response.statusCode == 200);
  }
}
