import 'package:flutter/material.dart';

import '../../components/index.dart';

class FindUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withDrawer: true,
      ),
      body: Container(
        child: Center(
          child: Text("Find Us Route"),
        ),
      ),
    );
  }
}
