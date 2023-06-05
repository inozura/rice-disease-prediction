import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preview_controller.dart';

class PreviewView extends GetView<PreviewController> {
  const PreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PreviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
