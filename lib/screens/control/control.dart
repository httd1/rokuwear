import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rokuwear/model/roku_device_model.dart';
import 'package:rokuwear/repository/roku_api_repository.dart';
import 'package:rokuwear/screens/control/components/commands.dart';
import 'package:rokuwear/screens/control/components/directional.dart';
import 'package:rokuwear/screens/control/components/entries.dart';
import 'package:rokuwear/screens/screen_base/screen_base.dart';

class Control extends StatefulWidget {
  final RokuDeviceModel rokuDevice;

  const Control({super.key, required this.rokuDevice});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Provider<RokuApiRepository>(
      create: (_) => RokuApiRepository(widget.rokuDevice.ssdp.apiLocation),
      child: ScreenBase(
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Directional(rokuDevice: widget.rokuDevice),
            Commands(rokuDevice: widget.rokuDevice),
            Entries(rokuDevice: widget.rokuDevice),
          ],
        ),
      ),
    );
  }
}
