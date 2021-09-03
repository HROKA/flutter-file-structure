import 'package:flutter/material.dart';

import '../../components/index.dart';

class FeedBackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withDrawer: true,
      ),
      body: Container(
        child: Center(
          child: Text("Feed back Route"),
        ),
      ),
    );
  }
}
