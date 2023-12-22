import 'package:flutter/material.dart';
import 'package:smart_home/smart_device.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    ["Smart light", 'assets/icons/light-bulb.png', true],
    ["Smart Ac", 'assets/icons/air-conditioner.png', false],
    ["Netflix", 'assets/icons/smart-tv.png', false],
    ["Smart Fan", 'assets/icons/fan.png', false],
  ];
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom appbar
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       vertical: verticalPadding, horizontal: horizontalPadding),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Image.asset(
            //         'assets/icons/menu.png',
            //         height: 50,
            //       ),
            //       Icon(
            //         Icons.person,
            //         size: 20,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  Text(
                    "Welcome Home Aakash",
                    style: TextStyle(fontSize: 20),
                    // textAlign: TextAlign.center,
                  ),
                  Text(
                    "Aakash Rajbanshi",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Text(
                "Devices",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.end,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDevice(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
