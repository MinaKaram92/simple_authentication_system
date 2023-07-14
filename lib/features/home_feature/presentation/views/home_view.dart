import 'package:authentication_system_flutter/core/custom_widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            CustomMaterialButton(pressed: () {}, text: 'Signout'),
          ],
        ),
      ),
    );
  }
}
