import 'package:http/http.dart' as http;
import 'package:rokuwear/model/device_model.dart';

// Documentação e referências
// https://developer.roku.com/pt-br/docs/developer-program/dev-tools/external-control-api.md

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

  /// Euivalente a um click no controle, key expecífica o botão
  Future<bool> keyPress(String key) async {
    var url = Uri.parse("$host/keypress/$key");
    var response = await http.post(url);

    return (response.statusCode == 200);
  }
}
