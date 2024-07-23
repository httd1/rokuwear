import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokuwear/model/roku_device_model.dart';
import 'package:rokuwear/repository/ssdp_repository.dart';
import 'package:rokuwear/screens/control/control.dart';
import 'package:rokuwear/screens/screen_base/screen_base.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    _listDevices();
  }

  @override
  void dispose() {
    context.read<SsdpRepository>().close();
    super.dispose();
  }

  void _listDevices() async {
    if (!mounted) return;

    // inicia busca de dispositivos na rede
    await context.read<SsdpRepository>().start();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      child: Consumer<SsdpRepository>(
        builder: (context, rokuDevice, child) {
          // sem dispositivos
          if (rokuDevice.deviceList.isEmpty) {
            return emptyDeviceList();
          }

          return Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: rokuDevice.deviceList.map((device) => containerDevice(device)).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget emptyDeviceList() {
    return const Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          Text(
            'Buscando dispositivos Roku na sua rede, ative o WiFi!',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget containerDevice(RokuDeviceModel device) {
    // icone da TV
    String iconDevice = "${device.ssdp.apiLocation}${device.device.icon}";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Control(
                rokuDevice: device,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade800,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: Image.network(iconDevice).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                device.device.friendlyName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
