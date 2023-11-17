import 'package:flutter/material.dart';
import '../generated/assets.dart';
import 'material_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await myPrecacheImage(context);
  }

  @override
  Widget build(BuildContext context) {
    return materialApp(
      context,
    );
  }
}
