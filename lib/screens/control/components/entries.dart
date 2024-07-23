import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokuwear/model/roku_device_model.dart';
import 'package:rokuwear/repository/roku_api_repository.dart';
import 'package:rokuwear/screens/screen_base/screen_base.dart';

class Entries extends StatefulWidget {
  final RokuDeviceModel rokuDevice;
  const Entries({super.key, required this.rokuDevice});

  @override
  State<Entries> createState() => _EntriesState();
}

class _EntriesState extends State<Entries> {
  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('InputTuner'),
                  color: Colors.blue,
                  icon: const Icon(
                    Icons.live_tv_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('InputHDMI1'),
                  color: Colors.green,
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.settings_input_hdmi_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('InputHDMI2'),
                  color: Colors.green,
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.settings_input_hdmi_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('InputHDMI3'),
                  color: Colors.green,
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.settings_input_hdmi_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('InputAV1'),
                  color: Colors.blue,
                  icon: const Icon(
                    Icons.cable_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
