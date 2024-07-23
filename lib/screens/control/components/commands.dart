import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokuwear/model/roku_device_model.dart';
import 'package:rokuwear/repository/roku_api_repository.dart';
import 'package:rokuwear/screens/screen_base/screen_base.dart';

class Commands extends StatefulWidget {
  final RokuDeviceModel rokuDevice;
  const Commands({super.key, required this.rokuDevice});

  @override
  State<Commands> createState() => _CommandsState();
}

class _CommandsState extends State<Commands> {
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
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurpleAccent),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('back'),
                  color: Colors.deepPurpleAccent,
                  icon: const Icon(
                    Icons.keyboard_backspace_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurpleAccent),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('home'),
                  color: Colors.deepPurpleAccent,
                  icon: const Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll<Size>(Size(50, 50)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.redAccent),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('PowerOff'),
                  color: Colors.deepPurpleAccent,
                  icon: const Icon(
                    Icons.power_settings_new_outlined,
                    color: Colors.white,
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
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurpleAccent),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('VolumeUp'),
                  color: Colors.deepPurpleAccent,
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.volume_up_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        '+',
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
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurpleAccent),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('VolumeDown'),
                  color: Colors.deepPurpleAccent,
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.volume_up_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        '-',
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
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.redAccent),
                  ),
                  onPressed: () async => await context.read<RokuApiRepository>().keyPress('VolumeMute'),
                  color: Colors.deepPurpleAccent,
                  icon: const Icon(
                    Icons.volume_off_rounded,
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
