import 'package:flutter/material.dart';

import '../../components/index.dart';

class RateUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withDrawer: true,
      ),
      body: Container(
        child: Center(
          child: Text("Rate us Route"),
        ),
      ),
    );
  }
}
