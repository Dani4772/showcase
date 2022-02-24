import 'package:flutter/material.dart';
import 'package:showcase/widgets.dart';
import 'package:showcaseview/showcaseview.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _key1=GlobalKey();
  BuildContext? myContext;

  @override
  void initState() {
WidgetsBinding.instance!.addPostFrameCallback((_) {
  ShowCaseWidget.of(myContext!)!.startShowCase([_key1]);
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
        builder: Builder(
      builder: (context) {
        myContext=context;
        return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: Colors.indigo[400],
          title: const Text('Settings'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Showcase(
                key: _key1,
                title: 'Change your water Intake Goal',
                description: 'Increase or decrease the number of cups for your goal',
                showcaseBackgroundColor: Colors.indigo,
                textColor: Colors.white,

                child: const SettingsControl(),

            ),

            const SizedBox(
              height: 30,
            ),
            Text(
              'Adjust Your Water intake goal',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                  fontSize: 16),
            ),
          ],
        ),
      );
      },
    ));
  }
}
