import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokuwear/model/roku_device_model.dart';
import 'package:rokuwear/repository/roku_api_repository.dart';
import 'package:vibration/vibration.dart';

class Directional extends StatefulWidget {
  final RokuDeviceModel rokuDevice;

  const Directional({super.key, required this.rokuDevice});

  @override
  State<Directional> createState() => _DirectionalState();
}

class _DirectionalState extends State<Directional> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () async => press('up'),
              icon: const Icon(Icons.keyboard_arrow_up_outlined),
              color: Colors.deepPurpleAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () async => press('left'),
                  icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  color: Colors.deepPurpleAccent,
                ),
                InkWell(
                  onTap: () async => press('select'),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async => press('right'),
                  icon: const Icon(Icons.keyboard_arrow_right_outlined),
                  color: Colors.deepPurpleAccent,
                ),
              ],
            ),
            IconButton(
              onPressed: () async => press('down'),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              color: Colors.deepPurpleAccent,
            )
          ],
        ),
      ),
    );
  }

  void press(String keyName) async {
    if ((await Vibration.hasVibrator()) ?? false) {
      Vibration.vibrate(duration: 10);
    }

    if (mounted) {
      await context.read<RokuApiRepository>().keyPress(keyName);
    }
  }
}
