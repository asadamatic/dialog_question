import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FirstMaterialApp());
}

class FirstMaterialApp extends StatelessWidget {
  const FirstMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First App Scaffold'),
        ),
        body: Center(
          child: DeviceFrame(
              device: Devices.ios.iPhone12, screen: const SecondMaterialApp()),
        ));
  }
}

class SecondMaterialApp extends StatelessWidget {
  const SecondMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Second Material App', home: SecondScaffold());
  }
}

class SecondScaffold extends StatelessWidget {
  const SecondScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second App Home'),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return Center(
              child: TextButton(
                child: const Text('Open Dialog'),
                onPressed: () async {
                  await showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (buildContext) => CustomDialog(width: constraint.minWidth,));
                },
              ),
            );
          }
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    this.width,
    Key? key,
  }) : super(key: key);

  final width;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dialog',
            style: TextStyle(fontSize: 20.0),
          ),

          Text(
            'Message Text',
          ),
        ],
      ),
    );
  }
}
