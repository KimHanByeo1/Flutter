import 'package:flutter/material.dart';
import 'package:rotation_different_screen_app/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  widgetDart wd = widgetDart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Screen'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return wd.Hello();
          } else {
            return wd.Flutter();
          }
        },
      ),
    );
  }

  // -- Functions
  // Widget Hello() {
  //   return Stack(
  //     children: [
  //       Center(
  //         child: ElevatedButton(
  //           onPressed: () {
  //             //
  //           },
  //           child: const Text(
  //             'Hello',
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget Flutter() {
  //   return Stack(
  //     children: [
  //       Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 //
  //               },
  //               child: const Text(
  //                 'Flutter',
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             Switch(
  //               value: switchValue,
  //               onChanged: (value) {
  //                 setState(() {
  //                   switchValue = value;
  //                 });
  //               },
  //             )
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
} // End
