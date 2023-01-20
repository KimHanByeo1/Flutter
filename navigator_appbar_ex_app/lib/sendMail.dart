import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Mail'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            Text('유비에게 보낸 메일'),
            Text('관우에게 보낸 메일'),
            Text('장비에게 보낸 메일'),
          ],
        ),
      ),
    );
  }
}
