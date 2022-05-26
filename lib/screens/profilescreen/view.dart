import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/fistimage.dart';
import 'components/personalinfo.dart';

class PageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FirstImage(),
          PersonalInfo(),
        ],
      ),
    );
  }
}