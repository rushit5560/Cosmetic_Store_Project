import 'package:flutter/material.dart';
import 'confirmation_screen_widgets.dart';

class ConfirmationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageAndTextModule(),
            const SizedBox(height: 25),
            BackToHomeButton(),
          ],
        ),
      ),
    );
  }

}
