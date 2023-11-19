import 'package:flutter/material.dart';
import 'package:loyaltty_customer/core/helpers/notification_helper/notification_helper.dart';
import '../generated/assets.dart';
import 'material_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    NotificationHelper.onInit();
    AwesomeOnInit.onInitAwesome();
    super.initState();
  }


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
