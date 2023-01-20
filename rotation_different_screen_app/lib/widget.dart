import 'package:flutter/material.dart';

class widgetDart {
  late bool switchValue = false;
  Widget Hello() {
    return Stack(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text(
              'Hello',
            ),
          ),
        )
      ],
    );
  }

  Widget Flutter() {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //
                },
                child: const Text(
                  'Flutter',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Switch(
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
