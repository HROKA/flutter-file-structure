import 'package:flutter/material.dart';

import '../../components/index.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withDrawer: true,
      ),
      body: Container(
        child: Center(
          child: Text("My Account Route"),
        ),
      ),
    );
  }
}
