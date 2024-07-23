import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rokuwear/model/device_model.dart';
import 'package:rokuwear/model/roku_device_model.dart';
import 'package:rokuwear/model/ssdp_model.dart';
import 'package:rokuwear/repository/roku_api_repository.dart';

class SsdpRepository extends ChangeNotifier {
  List<RokuDeviceModel> deviceList = [];

  late RawDatagramSocket socket;

  final InternetAddress ipRokuSearcher = InternetAddress('239.255.255.250');
  final int portSearcher = 1900;

  final String payload = "M-SEARCH * HTTP/1.1\r\n"
      "Host: 239.255.255.250:1900\r\n"
      "Man: \"ssdp:discover\"\r\n"
      "ST: roku:ecp\r\n";

  Future<void> start() async {
    // cria uma conexão UDP
    socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

    socket.broadcastEnabled = true;

    socket.joinMulticast(ipRokuSearcher);

    // faz primeira busca
    sendPayload(payload);

    socket.listen((RawSocketEvent? data) async {
      if (data == RawSocketEvent.read) {
        // pegando os dados
        Datagram? datagram = socket.receive();

        if (datagram != null) {
          // decodificando os dados
          String response = utf8.decode(datagram.data);

          // criando o modelo com as inf. de acesso ao dispositivos
          SsdpModel ssdp = SsdpModel.fromString(response);

          // info do dispositivo
          var apiDeviceInfo = RokuApiRepository(ssdp.apiLocation);
          DeviceModel device = await apiDeviceInfo.deviceInfo();

          deviceList.add(RokuDeviceModel(ssdp, device));
          notifyListeners();
        }
      }
    });
  }

  /// envia uma payload para a conexão UDP
  void sendPayload(String payload) {
    socket.send(utf8.encode(payload), ipRokuSearcher, portSearcher);
  }

  void close() {
    socket.close();
  }
}
